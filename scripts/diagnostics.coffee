module.exports = (robot) ->
  robot.respond /핑/i, (msg) ->
    msg.send "이런 쓸 데 없는 메세지에 답해주기 싫어!:rage:"

  robot.respond /생존신고|살아있니|생존확인/i, (msg) ->
    msg.send "나 살아있다. 걱정마 :wink:"

  robot.respond /모두소환/i, (msg) ->
    msg.send "<@everyone> 모두 모여라"
