# require
http = require 'http'
moment = require 'moment'
q = require 'q'
config = require '../config.json'

# weather api
weather_api_key = config.weather.key
weather_version = config.weather.version

module.exports = (robot) ->
  robot.respond /오늘의날씨 (.*)$/i, (msg) ->
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

# getWeather by api
getWeather = (msg, geoCode, location) ->
  msg.http("http://apis.skplanetx.com/weather/summary?version=#{weather_version}&lat=#{geoCode.lat}&lon=#{geoCode.lng}&appKey=#{weather_api_key}")
    .get() (err, res, body) ->
      response = JSON.parse(body)

      # response data
      city = response.weather.summary[0].grid.city
      county = response.weather.summary[0].grid.county

      todaySky = response.weather.summary[0].today.sky.name
      todayMaxTmp = Math.floor(response.weather.summary[0].today.temperature.tmax)
      todayMinTmp = Math.floor(response.weather.summary[0].today.temperature.tmin)

      # time = moment().add(9, 'h').format('MM월 DD일 HH시')
      msg.send "오늘의 날씨입니다.:wink:\n#{city} #{county}의 하늘은 '#{todaySky}'입니다.\n오늘 최저 기온은 #{todayMinTmp}도씨, 최고 기온은 #{todayMaxTmp}도씨 되겠습니다.\n감사합니다.:hugging_face:"
