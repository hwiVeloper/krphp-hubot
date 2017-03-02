moment = require 'moment'
# 크론잡 require
cronJob = require('cron').CronJob

moment.locale('ko');

module.exports = (robot) ->
  # 잘자요
  goodNightJob = new cronJob('0 0 0 * * *', goodNight(robot), null, true, "Asia/Seoul")
  goodNightJob.start()
  # 잘자요(일요일 끝)
  goodNightSundayJob = new cronJob('0 0 0 * * 2', goodNightSunday(robot), null, true, "Asia/Seoul")
  goodNightSundayJob.start()
  # 점심시간(평일)
  lunchTimeJob = new cronJob('0 0 12 * * 2-6', lunchTime(robot), null, true, "Asia/Seoul")
  lunchTimeJob.start()
  # 출근(평일)
  helloOfficeJob = new cronJob('0 0 9 * * 2-6', helloOffice(robot), null, true, "Asia/Seoul")
  helloOfficeJob.start()

# 0시에 goodNightJob
goodNight = (robot) ->
  -> robot.messageRoom '#general', '오늘 하루 고생 많았어요. 잘자요~'
# 일요일 0시에 goodNightSunday
goodNightSunday = (robot) ->
  -> robot.messageRoom '#general', '일요일이 끝났습니다...ㅠㅠ 월요일을 준비하며 잘자요 여러분..'
# 점심시간에 lunchTimeJob
lunchTime = (robot) ->
  -> robot.messageRoom '#general', '점심시간입니다! 맛점하세요 :)'
# 출근시간에 helloOfficeJob
helloOffice = (robot) ->
  -> robot.messageRoom '#general', '오늘 하루도 화이팅! ;)'
