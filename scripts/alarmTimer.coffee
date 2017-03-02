# 크론잡 require
cronJob = require('cron').CronJob

module.exports = (robot) ->
  # 잘자요
  goodNightJob = new cronJob('0 0 0 * * *', goodNight(robot), null, true, "Asia/Seoul")
  goodNightJob.start()
  # 점심시간
  lunchTimeJob = new cronJob('0 0 12 * * *', lunchTime(robot), null, true, "Asia/Seoul")
  lunchTimeJob.start()
  # 출근
  helloOfficeJob = new cronJob('0 0 9 * * *', lunchTime(robot), null, true, "Asia/Seoul")
  lunchTimeJob.start()

# 0시에 WakeUpDarkNight
goodNight = (robot) ->
  -> robot.messageRoom '#_general', '오늘 하루 고생 많았어요. 잘자요~'

# 점심시간에 lunchTime
lunchTime = (robot) ->
  -> robot.messageRoom '#_general', '점심시간입니다! 맛점하세요 :)'

# 출근시간에 helloOffice
helloOffice = (robot) ->
  -> robot.messageRoom '#_general', '오늘 하루도 화이팅! ;)'
