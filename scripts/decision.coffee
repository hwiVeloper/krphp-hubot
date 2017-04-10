# 결정 커맨드 라이브러리
# https://github.com/jaewoongh/telegram-bots
decisionLib = require '../lib/decision.js'
explicitCommands = decisionLib.explicitCommands
keywordList = decisionLib.keywordList
irregularTable = decisionLib.irregularTable
fallbackTexts = decisionLib.fallbackTexts

handleIrregulars = (text) ->
  i = 0
  while i < irregularTable.length
    regex = irregularTable[i].pattern
    match = text.trim().match regex
    if match == null
      i++
      continue
    return if match.length > 1 then text.replace regex, '$1' + irregularTable[i].fix else text.replace regex, irregularTable[i].fix
  text

class Behaviors
  pickOne: (matchResult, list) ->
    response = list[Math.floor(Math.random() * list.length)].replace('$', matchResult[1])
    return handleIrregulars(response)

  customPick: (matchResult) ->
    optionText = matchResult.input.slice(matchResult[0].length + matchResult.index).trim()
    options = optionText.split(',')
    if (options.length <= 1)
      options = optionText.split(' ')
    return options[Math.floor(Math.random() * options.length)].trim()

  # 마지막이라서 알아서 return 되는듯?
  fallback: ->
    if Math.random() < 0.2 then fallbackTexts[Math.floor(Math.random() * fallbackTexts.length)] else null

checkKeywordAndGetResponse = (text, msg) ->
  behaviors = new Behaviors
  if text == undefined
    msg.send "text is undefined"
    return null
  # Check explicit commands first
  i = 0
  while i < explicitCommands.length
    match = text.trim().match explicitCommands[i].command
    if match == null || match == false
      i++
      continue
    return behaviors.customPick(match, explicitCommands[i].parameter)
  # Check keywords
  i = 0
  while i < keywordList.length
    match = text.trim().match keywordList[i].keyword
    if match == null || match == false
      i++
      continue
    return behaviors.pickOne(match, keywordList[i].parameter)
  return

# 모듈의 메인
module.exports = (robot) =>
  robot.hear /(.*)/i, (msg) ->
    # 들어온 메세지
    message = msg.match['input']
    result = checkKeywordAndGetResponse(message, msg)
    if result != undefined
      msg.send "`결정요정` : " + result
