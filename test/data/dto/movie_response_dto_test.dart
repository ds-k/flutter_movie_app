import 'dart:convert';

import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'MovieResponseDto : fromJson test',
    () {
      const sampleJsonString = """
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
  "popularity": 5083.147,
  "poster_path": "/4zNUNhVpSqFggxqvdSXDRzy1QwE.jpg",
  "release_date": "2024-10-31",
  "title": "레드 원",
  "video": false,
  "vote_average": 7.026,
  "vote_count": 1480
}
""";
      final movie = MovieResponseDto.fromJson(jsonDecode(sampleJsonString));
      expect(movie.title, "레드 원");
      expect(movie.originalTitle, "Red One");
      expect(movie.popularity, 5083.147);
    },
  );
}
