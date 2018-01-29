FirebaseUtil = require './firebase'

module.exports = (robot) ->
  fb = new FirebaseUtil(robot,"info")
  robot.hear /\!기억 (.*)\S? (.*)\S?/i, (msg) ->
    saveInfo(msg,msg.match[1],msg.match[2],msg.message.user.name)

  robot.hear /\!알려 (.*)\S?/i, (msg) ->
    viewInfo(msg,msg.match[1])

  saveInfo = (msg,key,value,userName) ->
    info = {};
    info = {
      "info": value,
      "user": userName
    };
    fb.child(key).push(info).then ->
      msg.send "`#{key}`를 `#{value}`로 기억합니다"

  viewInfo = (msg,key) ->
    fb.child(key).once "value", (data) ->
      message = ""
      title = "#{key}"
      if(!data.val())
        msg.send "저장된 내용이 없어요 :ghost:"
      else
        for index,value of data.val()
          message += "\n#{value.info}-`#{value.user}`\n"
        msg.send "
        #{title}\n
        ----------\n
        #{message}\n
        ----------"