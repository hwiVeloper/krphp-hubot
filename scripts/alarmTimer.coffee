# 크론잡 require
cronJob = require('cron').CronJob

module.exports = (robot) ->
  # 잘자요
  goodNight = new cronJob('0 0 0 * * *', goodNight(robot), null, true, "Asia/Seoul")
  goodNight.start()
  # 점심시간
  lunchTime = new cronJob('0 0 12 * * *', lunchTime(robot), null, true, "Asia/Seoul")
  lunchTime.start()
  # 출근
  helloOffice = new cronJob('0 0 9 * * *', lunchTime(robot), null, true, "Asia/Seoul")
  lunchTime.start()
  # test
  test = new cronJob('0 0 9 * * *', test(robot), null, true, "Asia/Seoul")
  test.start()

# 0시에 WakeUpDarkNight
goodNight = (robot) ->
  -> robot.messageRoom '#_general', '오늘 하루 고생 많았어요. 잘자요~'

# 점심시간에 lunchTime
lunchTime = (robot) ->
  -> robot.messageRoom '#_general', '점심시간입니다! 맛점하세요 :)'

# 출근시간에 helloOffice
helloOffice = (robot) ->
  -> robot.messageRoom '#_general', '오늘 하루도 화이팅! ;)'

test = (robot) ->
  -> robot.messageRoom '#_general', 'cron job test'
