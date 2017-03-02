module.exports = (robot) ->
  robot.enter (res) ->
    robot.messageRoom "#general", "#{res.message.user.name}님, 환영해요 ~ 지금부터 맘껏 떠드시면 됩니다. :)"
