module.exports = (robot) ->
  robot.respond /(.*)메롱|메렁(.*)/i, (msg) ->
    msg.send "나도 메롱이다 녀석아 :stuck_out_tongue_closed_eyes:"

  robot.respond /(.*)안녕|안뇽(.*)/i, (msg) ->
    msg.send "안녕 반가워:hugging_face:"

  robot.respond /(.*)사랑해|사랑(.*)/i, (msg) ->
    msg.send "사, 사실... 나 사랑하는 사람 따로 있어. 미안해"
