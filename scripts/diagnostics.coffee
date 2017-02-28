module.exports = (robot) ->
  robot.respond /핑/, (msg) ->
    msg.send "퐁"

  robot.respond /생존신고|살아있니|생존확인/, (msg) ->
    msg.send "나 살아있다. 걱정마 :wink:"
