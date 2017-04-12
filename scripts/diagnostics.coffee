module.exports = (robot) ->
  robot.respond /핑/i, (msg) ->
    msg.send "이런 쓸 데 없는 메세지에 답해주기 싫어!:rage:"

  robot.respond /생존신고|살아있니|생존확인/i, (msg) ->
    msg.send "나 살아있다. 걱정마 :wink:"

  robot.respond /채널리스트/i, (msg) ->
    msg.send "<#C4BD72T8S|깃헙프로젝트>\n"
  robot.respond /하오님 불러줘/i, (msg) ->
    msg.send "<!haohao> 응답하세요."
