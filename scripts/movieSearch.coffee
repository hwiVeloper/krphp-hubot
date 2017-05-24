# require
http = require 'http'
moment = require 'moment'
q = require 'q'
config = require '../config.json'

# weather api
clientId = config.naver.clientId
clientSecret = config.naver.clientSecret

module.exports = (robot) ->
  robot.hear /영화검색 (.*)$/i, (msg) ->
    keyword = decodeURIComponent(unescape(msg.match[1]))
    getResult(msg, keyword)

# getGeocode by Google map
getResult = (msg, keyword) ->
  deferred= q.defer()
  msg.http("https://openapi.naver.com/v1/search/movie")
    .headers('X-Naver-Client-Id':clientId, 'X-Naver-Client-Secret': clientSecret)
    .query({
      query: keyword,
      display: 5
    })
    .get() (err, res, body) ->
      result = JSON.parse(body)
      message = "#{result.items[0].title}\n"
      message+= "#{result.items[1].title}\n"
      message+= "#{result.items[2].title}\n"
      message+= "#{result.items[3].title}\n"
      message+= "#{result.items[4].title}"

      message = message.replace /\<b>/g, '**'
      message = message.replace /\<\/b>/g, '**'
      msg.send(message)