loves = [
  "사, 사실... 나 사랑하는 사랑 따로 있어. 미안해.",
  "나도 사랑해~ :kissing_heart:",
  "글쎄? 난 너 하는 걸 봐서 ㅎㅎ",
  "사랑? 개나 줘버려",
  "어디서 수작이야?!"
]

module.exports = (robot) ->
  robot.respond /(.*)메롱|메렁(.*)/i, (msg) ->
    msg.send "나도 메롱이다! :stuck_out_tongue_closed_eyes:"

  robot.respond /(.*)안녕|안뇽(.*)/i, (msg) ->
    msg.send "안녕 반가워:hugging_face:"

  robot.respond /(.*)사랑해|사랑(.*)/i, (msg) ->
    love = msg.random loves
    msg.send "#{love}"
