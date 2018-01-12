Firebase = require 'firebase'
FirebaseTokenGenerator = require 'firebase-token-generator'
config = require '../config.js'
FIREBASE_URL = "https://krphp-hubot.firebaseio.com/"
FIREBASE_SECRET = config.firebase.secret

module.exports = (robot, ref) ->
  if ref?
    fb = new Firebase(FIREBASE_URL)
    fb = fb.child(ref)

    robot.logger.info ref

    if FIREBASE_SECRET?
      tokenGenerator = new FirebaseTokenGenerator FIREBASE_SECRET
      token = tokenGenerator.createToken({ "uid": "hubot", "hubot": true })
      fb.authWithCustomToken token, (error, authData) ->
        if error
          robot.logger.warning '인증실패', error

    return fb
  else
  robot.logger.warning "Ref is undefined"
