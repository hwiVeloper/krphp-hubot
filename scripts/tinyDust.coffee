# Thanks to:
#   Author:
#     myoungho.pak and jelly
#
# Editted by:
#   devhwi
#
# Commands:
#   미세먼지! <지역명>

# require
http = require 'http'
moment = require 'moment'
q = require 'q'
config = require '../config.js'

# define constant
weather_api_key = config.weather.key
weather_version = config.weather.version

module.exports = (robot) ->
  robot.hear /미세먼지! (.*)$/i, (msg) ->
    location = decodeURIComponent(unescape(msg.match[1]))
    getGeocode(msg, location)
    .then (geoCode) ->
        getDust(msg, geoCode, location)
    .catch ->
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

getDust = (msg, geoCode, location) ->
  msg.http("http://apis.skplanetx.com/weather/dust?version=#{weather_version}&lat=#{geoCode.lat}&lon=#{geoCode.lng}&appKey=#{weather_api_key}")
    .get() (err, res, body) ->
      response = JSON.parse(body)
      dust = response.weather.dust[0]

      station = dust.station.name
      time = moment(dust.timeObservation).format('오늘 A HH시')
      dustValue = Math.round(dust.pm10.value)
      dustGrade = dust.pm10.grade

      msg.send "관측소 `#{station}` : `#{time}`에 측정된 미세먼지 관측 결과입니다.\n현재 미세먼지 농도는 `#{dustValue}`이며, 등급은 `#{dustGrade}`입니다."
