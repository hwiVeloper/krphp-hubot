var env = process.env.NODE_ENV || "development";
var prodConfig = {
  "weather": {
    "version": 1,
    "key": process.env.WEATHER_KEY
  },
  "firebase": {
    "secret": process.env.FIREBASE_SECRET
  },
  "naver": {
    "clientId": process.env.NAVER_CLIENT_ID,
    "clientSecret": process.env.NAVER_CLIENT_SECRET
  }
};

var config = env === "production" ? prodConfig : require("./config.json");
module.exports = config;
