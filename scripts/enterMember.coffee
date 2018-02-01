def = require '../settings.json'

module.exports = (robot) ->
  robot.enter (res) ->
    if res.message.user.room is def.channel
      robot.messageRoom "#" + def.channel, "#{res.message.user.name}님, 환영해요 ~ 지금부터 맘껏 떠드시면 됩니다. :)"
