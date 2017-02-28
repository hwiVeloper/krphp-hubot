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
        msg.send '지역 불러오기를 실패하였습니다.'

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
      tomorrowMaxTmp = Math.floor(response.weather.summary[0].tomorrow.temperature.tmax)
      tomorrowMinTmp = Math.floor(response.weather.summary[0].tomorrow.temperature.tmin)

      # time = moment().add(9, 'h').format('MM월 DD일 HH시')
      msg.send "내일의 날씨입니다.:wink:\n#{city} #{county}의 하늘은 '#{tomorrowSky}'입니다.\n최저 기온은 #{tomorrowMinTmp}도씨, 최고 기온은 #{tomorrowMaxTmp}도씨 되겠습니다.\n감사합니다:hugging_face:"
