FirebaseUtil = require './firebase'

module.exports = (robot) ->
  fb = new FirebaseUtil(robot, "users")
  robot.hear /(.*)\S? 소환!/i, (msg) ->
    getData(msg,msg.match[1])

  robot.hear /사용자추가! (.*)\S? \/ (.*)\S?/i, (msg) ->
    saveUser(msg,msg.match[1],msg.match[2])

  robot.hear /사용자삭제! (.*)\S?/i, (msg) ->
    deleteUser(msg,msg.match[1])

  getData = (msg, key) ->
    fb.child(key).once "value", (data) ->
      userId = data.val()
      if(userId)
        msg.send "<@"+userId+"> 소환!!!"
      else
        msg.send "그런분은 없어요 :eyes:"

  saveUser = (msg, key, value) ->
    foo = {};
    foo[key] = value;
    fb.update(foo).then ->
      msg.send "#{key} -  #{value} 사용자 추가 완료!"

  deleteUser = (msg, key) ->
    fb.child(key).remove()
    .then ->
      msg.send "#{key} 사용자 삭제 완료!"