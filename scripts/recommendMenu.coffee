FirebaseUtil = require './firebase'
module.exports = (robot) ->
  fb = new FirebaseUtil(robot, "food")
  robot.hear /메뉴추천/i, (msg) ->
    getData(msg)

  robot.hear /메뉴추가 (.*)/i, (msg) ->
    saveData(msg, msg.match[1])

  getData = (msg) ->
    fb.once "value", (data) ->
      objectKeys = Object.keys(data.val())
      index = Math.floor(Math.random() * objectKeys.length)
      data.forEach (data) ->
        if(data.key() == objectKeys[index])
          msg.send "오늘 같은 날 " + "#{data.val()}" + " 어때요?"

  saveData = (msg, data) ->
    fb.push(data).then ->
      msg.send "메뉴 #{data} 추가 완료!"
