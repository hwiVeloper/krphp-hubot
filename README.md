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
# Cron Job 에 의한 타이머
# general 채널에서 다음 시간마다 메세지를 날려줍니다.
  * 출근 : 09시
  * 점심 : 12시
  * 굳밤 : 평일 00시, 일요일->월요일 00시
  * 정시 : 주말, 자는 시간(0~7시) 제외
  * 불금 : 금요일 퇴근시간

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

# 비서 역할
@krphp 오늘 오후 6시에 퇴근이라고 알려줘

# 결정요정
결정요정! <리스트1> <리스트2> <리스트3> ...
=> 리스트 중 하나를 선택해준다.

<...> ..<까> ..<까> ?
ex) 오늘밤 게임할까 말까? => 해, 하지마 등의 답을 준다.
```

## Local에서 실행하는 방법

```bash
$ clone https://github.com/devhwi/krphp-hubot.git
$ npm install
$ bin/hubot krphp
```

## 참조 출처

영감 및 몇 가지 아이디어 : 9xd bot 제작하신 qkraudghgh님의 [9xd-bot](https://github.com/qkraudghgh/9xd-bot)

결정요정 : 텔레그램 봇 제작자이신 jaewoongh님의 [Telegram-bots](https://github.com/jaewoongh/telegram-bots)(김결정)

## 문의사항 및 건의사항

Issues 에 건의하시거나 zziller03@gmail.com 로 문의 바랍니다.

Slack 멤버는 톡방 또는 Slack 채널에서 건의해주셔도 됩니다 :)
