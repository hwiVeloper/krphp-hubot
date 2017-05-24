# require
http = require 'http'
moment = require 'moment'
q = require 'q'
config = require '../config.json'

# weather api
clientId = config.naver.clientId
clientSecret = config.naver.clientSecret

module.exports = (robot) ->
  robot.hear /영화검색! (.*)$/i, (msg) ->
    keyword = decodeURIComponent(unescape(msg.match[1]))
    getResult(msg, keyword)

# getGeocode by Google map
getResult = (msg, keyword) ->
  deferred= q.defer()
  msg.http("https://openapi.naver.com/v1/search/movie")
    .headers('X-Naver-Client-Id':clientId, 'X-Naver-Client-Secret': clientSecret)
    .query({
      query: keyword,
      display: 10
    })
    .get() (err, res, body) ->
      result = JSON.parse(body)
      console.log("log =========" + result.items.length)
      message = ""
      for i in [0...result.items.length] by 1
        message += "#{result.items[i].title} | 연도 : `#{result.items[i].pubDate}` | 평점 : `#{result.items[i].userRating}` | 링크 : <#{result.items[i].link}>"
        if result.items.length-1 != i
          message += "\n"
      message = message.replace /\<b>/g, '*'
      message = message.replace /\<\/b>/g, '*'
      msg.send(message)