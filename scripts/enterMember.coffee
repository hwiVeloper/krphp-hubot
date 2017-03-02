module.exports = (robot) ->
  robot.enter (res) ->
    if res.message.user.room is 'general'
      robot.messageRoom "#general", "#{res.message.user.name}님, 환영해요 ~ 지금부터 맘껏 떠드시면 됩니다. :)"
    if res.message.user.room is 'free-board'
      robot.messageRoom "#free-board", "#{res.message.user.name}님, 환영해요 ~ 월급 루팡의 방입니다. :)"
