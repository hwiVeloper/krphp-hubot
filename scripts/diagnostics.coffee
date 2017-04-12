module.exports = (robot) ->
  robot.respond /핑/i, (msg) ->
    msg.send "이런 쓸 데 없는 메세지에 답해주기 싫어!:rage:"

  robot.respond /생존신고|살아있니|생존확인/i, (msg) ->
    msg.send "나 살아있다. 걱정마 :wink:"

  robot.hear /채널\S?리스트/i, (msg) ->
    msg.send "---------- krphp-dev 채널리스트 ----------\n
<#C47JUSU86|메인채팅방> : 디폴트 방입니다.\n
<#C4A2GEUDN|조잘조잘> : 맘껏 떠드는 곳입니다.\n
<#C46U8PYCA|랜덤채널> : 솔직히 뭐하는 곳인지 잘 모르겠습니다.\n
<#C4BD72T8S|깃헙프로젝트> : 프로젝트 관련 깃헙 방입니다."
  robot.respond /모두\s?소환/i, (msg) ->
    msg.send "<!channel> 응답하세요."
