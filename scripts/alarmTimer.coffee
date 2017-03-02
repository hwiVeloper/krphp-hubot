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
  helloOfficeJob = new cronJob('0 0 9 * * *', helloOffice(robot), null, true, "Asia/Seoul")
  helloOfficeJob.start()
  # test
  testJob = new cronJob('0 49 14 * * *', test(robot), null, true, "Asia/Seoul")
  testJob.start()

# 0시에 goodNightJob
goodNight = (robot) ->
  -> robot.messageRoom '#general', '오늘 하루 고생 많았어요. 잘자요~'
# 점심시간에 lunchTimeJob
lunchTime = (robot) ->
  -> robot.messageRoom '#general', '점심시간입니다! 맛점하세요 :)'
# 출근시간에 helloOfficeJob
helloOffice = (robot) ->
  -> robot.messageRoom '#general', '오늘 하루도 화이팅! ;)'
test = (robot) ->
  -> robot.messageRoom '#general', 'test입니다 :)'
