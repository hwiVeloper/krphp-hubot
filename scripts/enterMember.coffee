module.exports = (robot) ->
  robot.enter (res) ->
    if res.message.user.room is 'general'
      robot.messageRoom "#general", "#{res.message.user.name}님, 환영해요 ~ 맘껏 떠들기도 하고, 질문도 하는 채널입니다. :)"
    if res.message.user.room is 'free-board'
      robot.messageRoom "#free-board", "#{res.message.user.name}님, 환영해요 ~ 맘껏 떠드는 채널입니다. :)"
