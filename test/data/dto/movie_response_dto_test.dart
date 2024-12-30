import 'dart:convert';

import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'MovieResponseDto : fromJson test',
    () {
      const sampleJsonString = """
{
  "dates": {
    "maximum": "2025-01-01",
    "minimum": "2024-11-20"
  },
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/euYIwmwkmz95mnXvufEmbL6ovhZ.jpg",
      "genre_ids": [
        28,
        12,
        18
      ],
      "id": 558449,
      "original_language": "en",
      "original_title": "Gladiator II",
      "overview": "로마의 영웅이자 최고의 검투사였던 막시무스가 콜로세움에서 죽음을 맞이한 뒤 20여 년이 흐른 후. 쌍둥이 황제 게타와 카라칼라의 폭압 아래 시민을 위한 자유로운 나라 로마의 꿈은 잊힌 지 오래다. 한편 아카시우스 장군이 이끄는 로마군에 대패한 후 모든 것을 잃고 노예로 전락한 루시우스는 강한 권력욕을 지닌 마크리누스의 눈에 띄어 검투사로 발탁된다. 로마를 향한 걷잡을 수 없는 분노, 타고난 투사의 기질로 콜로세움에 입성하게 된 루시우스는 결투를 거듭하며 자신이 진짜 누구인지 알게 되고 마침내 로마의 운명을 건 결전을 준비하게 되는데...!",
      "popularity": 7979.938,
      "poster_path": "/b5UXjzW5cLZhprMnlAmsVAA3G4t.jpg",
      "release_date": "2024-11-05",
      "title": "글래디에이터 II",
      "video": false,
      "vote_average": 6.8,
      "vote_count": 1601
    },
    {
      "adult": false,
      "backdrop_path": "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
      "genre_ids": [
        28,
        14,
        35
      ],
      "id": 845781,
      "original_language": "en",
      "original_title": "Red One",
      "overview": "크리스마스 D-1, 철통같은 보안을 뚫고 코드명 '레드 원' 산타클로스가 납치되고 크리스마스가 사라질 위기에 처했다! '레드 원'을 찾기 위해 사령관 '칼럼 드리프트'는 산타클로스 따위는 없다고 믿는 현상금 사냥꾼 '잭 오말리'와 협력하기로 한다. 시작부터 삐그덕 거리는 이들 앞에 크리스마스의 존재를 위협하는 위험천만한 적들이 나타나는데…",
      "popularity": 4938.342,
      "poster_path": "/4zNUNhVpSqFggxqvdSXDRzy1QwE.jpg",
      "release_date": "2024-10-31",
      "title": "레드 원",
      "video": false,
      "vote_average": 7.0,
      "vote_count": 1559
    },
    {
      "adult": false,
      "backdrop_path": "/zOpe0eHsq0A2NvNyBbtT6sj53qV.jpg",
      "genre_ids": [
        28,
        878,
        35,
        10751
      ],
      "id": 939243,
      "original_language": "en",
      "original_title": "Sonic the Hedgehog 3",
      "overview": "",
      "popularity": 4258.313,
      "poster_path": "/5ZoI48Puf5i5FwI6HOpunDuJOw0.jpg",
      "release_date": "2024-12-19",
      "title": "수퍼 소닉 3",
      "video": false,
      "vote_average": 7.75,
      "vote_count": 184
    },
    {
      "adult": false,
      "backdrop_path": "/6qld2YxAO9gdEblo0rsEb8BcYKO.jpg",
      "genre_ids": [
        10749,
        18
      ],
      "id": 1156593,
      "original_language": "es",
      "original_title": "Culpa tuya",
      "overview": "전 세계적인 히트작 '나의 잘못'의 속편. 노아와 닉의 사랑은 둘을 떼어놓으려는 부모님의 노력에도 불구하고 흔들림이 없어 보인다. 하지만 닉의 직업과 노아의 대학 진학은 두 사람의 관계와 레이스테르 가족의 근간을 흔들 새로운 관계로 그들의 삶을 안내한다. 많은 사람이 두 사람 사이를 파괴하려는 가운데 이 둘은 결국 행복을 맞이할 수 있을까?",
      "popularity": 5541.871,
      "poster_path": "/zuctS3p8Bs9IeYv5ScKeOKp5Na5.jpg",
      "release_date": "2024-12-26",
      "title": "네 잘못이야",
      "video": false,
      "vote_average": 7.718,
      "vote_count": 277
    },
    {
      "adult": false,
      "backdrop_path": "/tElnmtQ6yz1PjN1kePNl8yMSb59.jpg",
      "genre_ids": [
        16,
        12,
        10751,
        35
      ],
      "id": 1241982,
      "original_language": "en",
      "original_title": "Moana 2",
      "overview": "바다를 누볐던 선조들에게서 예기치 못한 부름을 받은 모아나가 마우이와 다시 만나 새로운 선원들과 함께 오랫동안 잊혀진 멀고 위험한 바다 너머로 떠나는 특별한 모험을 담은 이야기",
      "popularity": 3081.616,
      "poster_path": "/2WVvPcVRqfjyVzIUVIcszGb6zT4.jpg",
      "release_date": "2024-11-21",
      "title": "모아나 2",
      "video": false,
      "vote_average": 7.0,
      "vote_count": 641
    },
    {
      "adult": false,
      "backdrop_path": "/oHPoF0Gzu8xwK4CtdXDaWdcuZxZ.jpg",
      "genre_ids": [
        12,
        10751,
        18,
        16
      ],
      "id": 762509,
      "original_language": "en",
      "original_title": "Mufasa: The Lion King",
      "overview": "길을 잃고 혼자가 된 새끼 사자 무파사는 광활한 야생을 떠돌던 중 왕의 혈통이자 예정된 후계자 타카와 우연히 만나게 된다. 마치 친형제처럼 끈끈한 우애를 나누며 함께 자란 무파사와 타카는 운명을 개척하기 위해 거대한 여정을 함께 떠난다. 한 치 앞을 알 수 없는 적들의 위협 속에서 두 형제의 끈끈했던 유대에 금이 가기 시작하고 예상치 못한 위기까지 맞닥뜨리게 되는데…",
      "popularity": 2773.199,
      "poster_path": "/1VUExee8iFohFTwYVi4IOArYyaM.jpg",
      "release_date": "2024-12-18",
      "title": "무파사: 라이온 킹",
      "video": false,
      "vote_average": 7.244,
      "vote_count": 299
    },
    {
      "adult": false,
      "backdrop_path": "/rhc8Mtuo3Kh8CndnlmTNMF8o9pU.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 1005331,
      "original_language": "en",
      "original_title": "Carry-On",
      "overview": "크리스마스이브, 항공기에 위험한 물건을 실으라는 강요를 받은 공항 보안 요원. 이 위협에서 벗어나려면, 의문의 여행자보다 한 수 앞서 움직여야 한다.",
      "popularity": 2090.732,
      "poster_path": "/moQ4z3yKFwd7CuNqrLINMl1pdp.jpg",
      "release_date": "2024-12-05",
      "title": "캐리온",
      "video": false,
      "vote_average": 6.989,
      "vote_count": 1170
    },
    {
      "adult": false,
      "backdrop_path": "/dWkdmxIkH9y23s9v1PjQFhTGIwo.jpg",
      "genre_ids": [
        28,
        18,
        53
      ],
      "id": 1043905,
      "original_language": "en",
      "original_title": "Dirty Angels",
      "overview": "2021년 미국의 아프가니스탄 철군 당시, 의료 구호 팀으로 위장한 여성 군인들이 납치된 십대 소년·소녀들을 구출하기 위해 다시 투입된다. 이들은 ISIS와 탈레반 사이에 갇힌 피해자들을 구출하는 임무를 맡는다.",
      "popularity": 2050.799,
      "poster_path": "/3O3qSGmjRGc10hMwFul8WDxKE5t.jpg",
      "release_date": "2024-12-11",
      "title": "더티 엔젤스",
      "video": false,
      "vote_average": 6.724,
      "vote_count": 58
    },
    {
      "adult": false,
      "backdrop_path": "/6lE2e6j8qbtQR8aHxQNJlwxdmKV.jpg",
      "genre_ids": [
        28,
        80,
        53
      ],
      "id": 974453,
      "original_language": "en",
      "original_title": "Absolution",
      "overview": "",
      "popularity": 1495.579,
      "poster_path": "/2MeQG5Vq8rUnRAa463BZe5GNhVk.jpg",
      "release_date": "2024-10-31",
      "title": "앱솔루션",
      "video": false,
      "vote_average": 6.059,
      "vote_count": 186
    },
    {
      "adult": false,
      "backdrop_path": "/au3o84ub27qTZiMiEc9UYzN74V3.jpg",
      "genre_ids": [
        28,
        878,
        53
      ],
      "id": 1035048,
      "original_language": "en",
      "original_title": "Elevation",
      "overview": "한 명의 싱글파더와 두 명의 여성이 어린 소년의 생명을 구하기 위해 집이라는 안전한 공간을 떠나 괴물 같은 생명체들과 맞서게 된다.",
      "popularity": 1685.003,
      "poster_path": "/uQhYBxOVFU6s9agD49FnGHwJqG5.jpg",
      "release_date": "2024-11-07",
      "title": "엘리베이션",
      "video": false,
      "vote_average": 6.3,
      "vote_count": 208
    },
    {
      "adult": false,
      "backdrop_path": "/t98L9uphqBSNn2Mkvdm3xSFCQyi.jpg",
      "genre_ids": [
        27,
        878
      ],
      "id": 933260,
      "original_language": "en",
      "original_title": "The Substance",
      "overview": "더 나은 버전의 당신을 꿈꿔본 적 있나요? 당신의 인생을 바꿔줄 신제품 ‘서브스턴스’. ‘서브스턴스’는 또 다른 당신을 만들어냅니다. 새롭고, 젊고, 더 아름답고, 더 완벽한 당신을. 단 한가지 규칙, 당신의 시간을 공유하면 됩니다. 당신을 위한 일주일, 새로운 당신을 위한 일주일, 각각 7일간의 완벽한 밸런스. 쉽죠? 균형을 존중한다면… 무엇이 잘못될 수 있을까요?",
      "popularity": 939.826,
      "poster_path": "/5TPPefBI1OzWnSQfBkOrv1OFGq5.jpg",
      "release_date": "2024-09-07",
      "title": "서브스턴스",
      "video": false,
      "vote_average": 7.183,
      "vote_count": 2830
    },
    {
      "adult": false,
      "backdrop_path": "/v9Du2HC3hlknAvGlWhquRbeifwW.jpg",
      "genre_ids": [
        28,
        12,
        53
      ],
      "id": 539972,
      "original_language": "en",
      "original_title": "Kraven the Hunter",
      "overview": "죽음의 문턱에서 맹수의 초인적인 힘을 얻고 살아 돌아온 크레이븐이 무자비한 복수의 길을 택하며 거침없는 사냥을 펼치는 액션 블록버스터",
      "popularity": 843.085,
      "poster_path": "/bA45ooXcp2B2qnMePfZ9QDL4wR5.jpg",
      "release_date": "2024-12-11",
      "title": "크레이븐 더 헌터",
      "video": false,
      "vote_average": 5.9,
      "vote_count": 226
    },
    {
      "adult": false,
      "backdrop_path": "/h3fwlwHotd3JfV13HdW0mxDcxPD.jpg",
      "genre_ids": [
        35,
        10749
      ],
      "id": 957119,
      "original_language": "en",
      "original_title": "Sidelined: The QB and Me",
      "overview": "",
      "popularity": 769.277,
      "poster_path": "/hklQwv6QVoOp5bWyh1bjuF2ydyG.jpg",
      "release_date": "2024-11-29",
      "title": "Sidelined: The QB and Me",
      "video": false,
      "vote_average": 6.3,
      "vote_count": 86
    },
    {
      "adult": false,
      "backdrop_path": "/4cp40IyTpFfsT2IKpl0YlUkMBIR.jpg",
      "genre_ids": [
        10749,
        35,
        18
      ],
      "id": 1064213,
      "original_language": "en",
      "original_title": "Anora",
      "overview": "뉴욕의 스트리퍼 ‘아노라’는 자신의 바를 찾은 철부지 러시아 재벌2세 ‘이반’을 만나게 되고 충동적인 사랑을 믿고 허황된 신분 상승을 꿈꾸며 결혼식을 올리게 된다. 그러나 신데렐라 스토리를 꿈꿨던 것도 잠시, 한 번도 본 적 없는 ‘이반’의 부모님이 아들의 결혼 사실을 알게 되자 길길이 날뛰며 미국에 있는 하수인 3인방에게 둘을 잡아 혼인무효소송을 진행할 것을 지시한다. 하수인 3인이 들이닥치자 부모님이 무서워 겁에 질린 남편 ‘이반’은 ‘아노라’를 버린채 홀로 도망친다. ‘이반’을 찾아 결혼 생활을 유지하고 싶은 ‘아노라’와 어떻게든 ‘이반’을 찾아 혼인무효소송을 시켜야만 하는 하수인 3인방의 대환장 발악이 시작된다.",
      "popularity": 798.497,
      "poster_path": "/mwguqSMRCA3NgpPoRsXdFhid25m.jpg",
      "release_date": "2024-10-14",
      "title": "아노라",
      "video": false,
      "vote_average": 7.0,
      "vote_count": 553
    },
    {
      "adult": false,
      "backdrop_path": "/evFChfYeD2LqobEJf8iQsrYcGTw.jpg",
      "genre_ids": [
        28,
        80,
        53
      ],
      "id": 1182387,
      "original_language": "en",
      "original_title": "Armor",
      "overview": "",
      "popularity": 853.975,
      "poster_path": "/685wCHwr2kyQZxvThNIM04HuuCt.jpg",
      "release_date": "2024-10-30",
      "title": "Armor",
      "video": false,
      "vote_average": 5.604,
      "vote_count": 101
    },
    {
      "adult": false,
      "backdrop_path": "/A28EE0vgHrB0OdoxWWMfgfyEoYn.jpg",
      "genre_ids": [
        80,
        53,
        28
      ],
      "id": 1276945,
      "original_language": "nl",
      "original_title": "Ferry 2",
      "overview": "그동안 일궈온 마약 제국을 잃은 페리 보우만. 브라반트의 암흑가를 떠나 평화를 찾은 듯했는데, 과거가 다시 그를 쫓아온다.",
      "popularity": 1092.304,
      "poster_path": "/16LezCAIDebuWiQQHzGGvjNiyv7.jpg",
      "release_date": "2024-12-19",
      "title": "페리 2",
      "video": false,
      "vote_average": 5.6,
      "vote_count": 54
    },
    {
      "adult": false,
      "backdrop_path": "/ag66gJCiZ06q1GSJuQlhGLi3Udx.jpg",
      "genre_ids": [
        27,
        53
      ],
      "id": 1138194,
      "original_language": "en",
      "original_title": "Heretic",
      "overview": "콜로라도의 작은 마을을 방문한 두 명의 젊은 몰몬교 여성 선교사들이 주민에게 복음을 전파하기 위해 집집마다 방문 중에 매력적인 리드 씨라는 인물을 만나게 되고, 그의 집에서 예상치 못한 위험에 휩싸이게 된다.",
      "popularity": 785.393,
      "poster_path": "/5HJqjCTcaE1TFwnNh3Dn21be2es.jpg",
      "release_date": "2024-10-31",
      "title": "헤러틱",
      "video": false,
      "vote_average": 7.115,
      "vote_count": 605
    },
    {
      "adult": false,
      "backdrop_path": null,
      "genre_ids": [
        10749,
        18
      ],
      "id": 1252309,
      "original_language": "es",
      "original_title": "Pídeme lo que quieras",
      "overview": "",
      "popularity": 788.086,
      "poster_path": "/76qnVxU2rPdVvipBN3DPQH6fVYB.jpg",
      "release_date": "2024-11-29",
      "title": "Pídeme lo que quieras",
      "video": false,
      "vote_average": 5.9,
      "vote_count": 11
    },
    {
      "adult": false,
      "backdrop_path": "/uVlUu174iiKhsUGqnOSy46eIIMU.jpg",
      "genre_ids": [
        18,
        10749,
        14
      ],
      "id": 402431,
      "original_language": "en",
      "original_title": "Wicked",
      "overview": "자신의 진정한 힘을 아직 발견하지 못한 엘파바와 자신의 진정한 본성을 발견하지 못한 글린다, 전혀 다른 두 인물이 우정을 쌓아가며 맞닥뜨리는 예상치 못한 위기와 모험을 그린 이야기",
      "popularity": 692.694,
      "poster_path": "/mHozMgx7w29qC9gLzUQDQEP7AEM.jpg",
      "release_date": "2024-11-20",
      "title": "위키드",
      "video": false,
      "vote_average": 7.421,
      "vote_count": 688
    }
  ],
  "total_pages": 244,
  "total_results": 4870
}
""";
      final movie = MovieResponseDto.fromJson(jsonDecode(sampleJsonString));
      expect(movie.results[0].title, "레드 원");
      expect(movie.results[0].originalTitle, "Red One");
      expect(movie.results[0].popularity, 5083.147);
    },
  );
}
