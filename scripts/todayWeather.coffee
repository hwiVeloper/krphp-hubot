# require
http = require 'http'
moment = require 'moment'
q = require 'q'
config = require '../config.json'

# weather api
weather_api_key = config.weather.key
weather_version = config.weather.version

module.exports = (robot) ->
  robot.hear /오늘의날씨 (.*)$/i, (msg) ->
    location = decodeURIComponent(unescape(msg.match[1]))
    getGeocode(msg, location)
    .then (geoCode) ->
        getWeather(msg, geoCode, location)
    .catch ->
        msg.send '지역 불러오기를 실패하였습니다.'

# getGeocode by Google
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
  msg.http("http://apis.skplanetx.com/weather/summary?version=#{weather_version}&lat=#{geoCode.lat}&lon=#{getCode.lon}")
    .get() (err, res, body) ->
      response = JSON.parse(body)

      # response data
      city = response.weather.summary.grid.city
      county = response.weather.summary.grid.county

      time = moment().add(9, 'h').format('MM월 DD일 HH시')
      msg.send "#{city} #{county}"
