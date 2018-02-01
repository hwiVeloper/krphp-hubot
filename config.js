var env = process.env.NODE_ENV || "development";
var prodConfig = {
  "weather": {
    "version": 1,
    "key": process.env.WEATHER_KEY
  },
  "firebase": {
    "secret": process.env.FIREBASE_SECRET,
    "url": process.env.FIREBASE_URL
  },
  "naver": {
    "clientId": process.env.NAVER_CLIENT_ID,
    "clientSecret": process.env.NAVER_CLIENT_SECRET
  }
};

var config = env === "production" ? prodConfig : require("./config.json");
var def = require('./settings.json');

var manual = "--------도움말----------\n";
    manual+= "# 우리동네의 오늘의 날씨 알아보기\n";
    manual+= "@" + def.botName + "오늘의날씨 <동네이름(읍면동/시군구 단위)>\n\n";
    manual+= "# 미세먼지\n";
    manual+= "미세먼지! <동네이름(읍면동/시군구 단위)>\n\n";
    manual+= "";
    manual+= "# 간단한 대화\n";
    manual+= "`@" + def.botName + " 메롱`\n";
    manual+= "`@" + def.botName + " 안녕`\n";
    manual+= "`@" + def.botName + " 사랑해`\n\n";
    manual+= "";
    manual+= "`@" + def.botName + " 오늘 오후 6시에 퇴근이라고 알려줘`     - # `알림`\n";
    manual+= "`영화검색! <검색어>`                          - # `영화검색`\n\n";
    manual+= "";
    manual+= "# 결정요정";
    manual+= "`결정요정! <리스트1> <리스트2> <리스트3> ...`  - # `결정요정 리스트`\n";
    manual+= "`<...> ..<까> ..<까> ?`                      - # `결정요정 응답`\n\n";
    manual+= "";
    manual+= "# 메뉴 관련 명령어\n\n";
    manual+= "";
    manual+= "`메뉴추가 <메뉴명>`                           - # `메뉴추가`\n";
    manual+= "`메뉴추천`                                    - # `메뉴추천\n`";
    manual+= "`메뉴리스트`                                  - # `메뉴리스트`\n\n";
    manual+= "";
    manual+= "# 사용자 관련 명령어\n";
    manual+= "`사용자추가! <부를 키값> - <사용자ID값>`        - # `사용자 호출 추가`\n";
    manual+= "`사용자삭제! <키값>`                           - # `사용자 호출 삭제`\n";
    manual+= "`<키값> 소환!`                                - # `사용자 호출`\n\n";
    manual+= "";
    manual+= "# 기억 기능 명령어\n";
    manual+= "`!기억 <키값> - <저장할 내용>`        - # `키값에 내용 저장`\n";
    manual+= "`!알려 <키값>`                       - # `해당 키에 저장된 내용 호출`\n";
    manual+= "------------------------\n";

config['manual'] = manual;

module.exports = config;
