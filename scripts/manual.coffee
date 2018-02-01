config = require '../config.js'

module.exports = (robot) ->
  robot.hear /\!도움말|\!help/i, (msg) ->
    msg.reply config.manual