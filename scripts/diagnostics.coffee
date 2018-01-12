module.exports = (robot) ->
  robot.respond /핑/i, (msg) ->
    msg.send "이런 쓸 데 없는 메세지에 답해주기 싫어!:rage:"

  robot.respond /생존신고|살아있니|생존확인/i, (msg) ->
    msg.send "나 살아있다. 걱정마 :wink:"

  robot.hear /채널\S?리스트/i, (msg) ->
    msg.send "---------- IDUCS 채널리스트 ----------\n
<#C8M3G670E|공지> : 공지사항 채널입니다.\n
<#C8L87RMPE|수다> : 기본 채팅방입니다.\n
<#C8KH8FVRN|웹개발자> : 웹개발자 채널입니다.\n
<#C8L50NKGB|앱개발자> : 앱개발자 채널입니다.\n"
  robot.respond /모두\s?소환/i, (msg) ->
    msg.send "<!channel> 응답하세요."
