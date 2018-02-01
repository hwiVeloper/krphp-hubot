moment = require 'moment'
# 크론잡 require
cronJob = require('cron').CronJob

def = require '../settings.json'

moment.locale('ko');

# 요일 정보
# 0: 일요일 - 6: 토요일
# 1-5: 평일

module.exports = (robot) ->
  # robot.respond /정시알림 (중지|하지마|그만|그만해)/i, (msg) ->
  #   msg.send "정시알림을 중지합니다. 재개하려면 정시알림 (재개|해줘|해) 라고 말씀해주세요. :wink:"
  #   exactTimeJob.stop()
  # robot.respond /정시알림 (재개|해줘|해)/i, (msg) ->
  #   msg.send "정시알림을 시작합니다. 그만하려면 정시알림 (중지|하지마|그만|그만해) 라고 말씀해주세요. :wink:"
  #   exactTimeJob.start()
  # 정시 (주말 & 자는 시간에는 울리지 않는다.)
  # exactTimeJob = new cronJob('0 0 8-23 * * 1-5', exactTime(robot), null, true, "Asia/Seoul")
  # 잘자요
  goodNightJob = new cronJob('0 0 0 * * 1-5', goodNight(robot), null, true, "Asia/Seoul")
  goodNightJob.start()
  # 잘자요(일요일 끝)
  goodNightSundayJob = new cronJob('0 0 0 * * 1', goodNightSunday(robot), null, true, "Asia/Seoul")
  goodNightSundayJob.start()
  # 점심시간(평일)
  lunchTimeJob = new cronJob('0 0 12 * * 1-5', lunchTime(robot), null, true, "Asia/Seoul")
  lunchTimeJob.start()
  # 점심시간 후(평일)
  recommendMenuJob = new cronJob('0 0 13 * * 1-5', recommendMenu(robot), null, true, "Asia/Seoul")
  recommendMenuJob.start()
  # 출근(평일)
  helloOfficeJob = new cronJob('0 0 9 * * 1-5', helloOffice(robot), null, true, "Asia/Seoul")
  helloOfficeJob.start()
  # 불금
  itsFridayJob = new cronJob('0 0 18 * * 5', itsFriday(robot), null, true, "Asia/Seoul")
  itsFridayJob.start()

# 매 정시마다 exactTime
# exactTime = (robot) ->
#   -> robot.messageRoom '#' + def.channel, ":alarm_clock: #{moment().format('a h시')}를 알립니다."
# # 0시에 goodNightJob
goodNight = (robot) ->
  -> robot.messageRoom '#' + def.channel, '오늘 하루 고생 많았어요. 잘자요~ :sleeping:'
# 일요일 0시에 goodNightSunday
goodNightSunday = (robot) ->
  -> robot.messageRoom '#' + def.channel, '일요일이 끝났습니다...:cry: 월요일을 준비하며 잘자요 여러분..'
# 점심시간에 lunchTimeJob
lunchTime = (robot) ->
  -> robot.messageRoom '#' + def.channel, '점심시간입니다! 맛점하세요 :heart_eyes::meat_on_bone:'
# 점심 먹고 메뉴 추천
recommendMenu = (robot) ->
  -> robot.messageRoom '#' + def.channel, '점심 맛있게 드셨나요? :kissing_cat: `메뉴추가 메뉴이름`을 통해 메뉴판을 채워주세요!'
# 출근시간에 helloOfficeJob
helloOffice = (robot) ->
  -> robot.messageRoom '#' + def.channel, '오늘 하루도 화이팅! :wink:'
# 불금 itsFriday
itsFriday = (robot) ->
  -> robot.messageRoom '#' + def.channel, ':fire::fire::fire: 불금입니다. 오예! 즐거운 주말 되세요! :fire::fire::fire:'
