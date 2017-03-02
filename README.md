# krphp hubot
[![Slack](https://img.shields.io/badge/Slack-krphp--dev-blue.svg)](https://krphp-dev.slack.com)
[![Travis](https://img.shields.io/travis/rust-lang/rust.svg)]()

krphp-dev는 한국 php 개발자 모임 슬랙 그룹입니다. 이 [Hubot][hubot]은 슬랙 그룹을 위해 만들어졌습니다. 심심풀이로 만들어보았습니다.
[Heroku][heroku]에 빌드하여 작동하고 있습니다.

[krphp-dev Slack][krphp-dev]

[heroku]: http://www.heroku.com
[hubot]: http://hubot.github.com
[krphp-dev]: https://krphp-dev.slack.com

## 권장사항

이 ```repo```는 node.js를 필요로 하며, coffeescript로 작성되었습니다.

## 슬랙에서 실행하기

```
## Cron Job 에 의한 타이머
# general 채널에서 다음 시간마다 메세지를 날려줍니다.
  * 출근 : 09시
  * 점심 : 12시
  * 굳밤 : 00시

## < > 은 텍스트를 지칭합니다.

# 우리동네의 오늘의 날씨 알아보기
@krphp 오늘의날씨 <동네이름(읍면동/시군구 단위>

# diagnostics
@krphp 핑
@krphp 생존신고 || 생존확인 || 살아있니

# 간단한 대화
@krphp 메롱
@krphp 안녕
@krphp 사랑해
```

## Local에서 실행하는 방법

```bash
$ clone https://github.com/devhwi/krphp-hubot.git
$ npm install
$ bin/hubot krphp
```

## 문의사항 및 건의사항

Issues 에 건의하시거나 zziller03@gmail.com 로 문의 바랍니다.

Slack 멤버는 톡방 또는 Slack 채널에서 건의해주셔도 됩니다 :)
