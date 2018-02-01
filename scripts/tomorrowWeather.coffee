# require
http = require 'http'
moment = require 'moment'
q = require 'q'
config = require '../config.json'

# weather api
weather_api_key = config.weather.key
weather_version = config.weather.version

module.exports = (robot) ->
  robot.respond /내일의날씨 (.*)$/i, (msg) ->
    location = decodeURIComponent(unescape(msg.match[1]))
    getGeocode(msg, location)
    .then (geoCode) ->
        getWeather(msg, geoCode, location)
    .catch (err)->
        msg.send '그런 지역은 없어요. :cry:'

# getGeocode by Google map
getGeocode = (msg, location) ->
  deferred= q.defer()
  msg.http("https://maps.googleapis.com/maps/api/geocode/json")
    .query({
      address: location
    })
    .get() (err, res, body) ->
      response = JSON.parse(body)
      if response.status is "OK"
        geoCode = {
          lat : response.results[0].geometry.location.lat
          lng : response.results[0].geometry.location.lng
        }
        deferred.resolve(geoCode)
      else
        deferred.reject(err)
  return deferred.promise

# 내일의 날씨
# getWeather by api
getWeather = (msg, geoCode, location) ->
  msg.http("http://apis.skplanetx.com/weather/summary?version=#{weather_version}&lat=#{geoCode.lat}&lon=#{geoCode.lng}&appKey=#{weather_api_key}")
    .get() (err, res, body) ->
      response = JSON.parse(body)

      # response data
      city = response.weather.summary[0].grid.city
      county = response.weather.summary[0].grid.county

      tomorrowSky = response.weather.summary[0].tomorrow.sky.name
      tomorrowSkyCode = response.weather.summary[0].tomorrow.sky.code
      tomorrowMaxTmp = Math.floor(response.weather.summary[0].tomorrow.temperature.tmax)
      tomorrowMinTmp = Math.floor(response.weather.summary[0].tomorrow.temperature.tmin)

      additionalMsg = switch tomorrowSkyCode
        when "SKY_M01", "SKY_M02" then "`날씨 최고!`"
        when "SKY_M03", "SKY_M04" then "`하늘이 우중충하겠어요..`"
        when "SKY_M05" then "`우산 챙기세요!`"
        when "SKY_M06" then "`눈길 조심하세요!`"
        when "SKY_M07" then "`땅이 질척거리겠군요`"
        else "?"
      # time = moment().add(9, 'h').format('MM월 DD일 HH시')
      msg.send "내일의 날씨입니다.:wink:\n#{city} #{county}의 하늘은 '#{tomorrowSky}'입니다.\n#{additionalMsg}\n최저 기온은 #{tomorrowMinTmp}도씨, 최고 기온은 #{tomorrowMaxTmp}도씨 되겠습니다.\n감사합니다:hugging_face:"
