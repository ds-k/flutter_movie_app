# Flutter Movie App 🎬

**Flutter Movie App**은 Riverpod과 TMDB API를 활용하여 Clean Architecture 기반으로 제작된 영화 정보 애플리케이션입니다.  
영화의 기본 정보, 세부 정보, 관련 영상을 제공하며, 효율적인 상태 관리와 테스트 코드 작성에 중점을 두었습니다.

---

## 📽️ 전체 시연 GIF
![Simulator Screen Recording - iPhone 16 Pro - 2025-01-02 at 11 14 21](https://github.com/user-attachments/assets/f752be73-b556-47fa-a99f-a6d18b1e231b)



---

## 🔑 주요 기능

1. **ListView를 이용한 영화 리스트 화면 렌더링**
   - Shimmer를 활용해 로딩 중 회색 배경 표시.
2. **Hero 애니메이션 구현**
   - 리스트에서 영화 포스터를 선택하면 세부 정보 페이지로 부드럽게 전환.
3. **Clean Architecture 적용**
   - 데이터 소스, 도메인, 프레젠테이션 레이어로 구분하여 설계.
4. **나만의 기능: 영화 관련 영상 표시**
   - Detail Page에서 TMDB Video API를 이용해 영화 관련 영상 정보를 표시.
5. **테스트 코드 작성**
   - 데이터 소스, DTO, 레포지토리, UseCase 등에 대한 단위 테스트 포함.

---

## 🛠️ 디렉토리 구조
```
├── lib
│   ├── data
│   │   ├── data_source
│   │   │   ├── movie_data_source.dart
│   │   │   └── movie_data_source_impl.dart
│   │   ├── dto
│   │   │   ├── movie_detail_dto.dart
│   │   │   ├── movie_response_dto.dart
│   │   │   └── movie_videos_dto.dart
│   │   └── repository
│   │       └── movie_repository_impl.dart
│   ├── domain
│   │   ├── entity
│   │   │   ├── movie.dart
│   │   │   ├── movie_detail.dart
│   │   │   └── movie_videos.dart
│   │   ├── repository
│   │   │   └── movie_repository.dart
│   │   └── usecase
│   │       ├── fetch_movie_detail_usecase.dart
│   │       ├── fetch_movie_videos_usecase.dart
│   │       ├── fetch_now_playing_movies_usecase.dart
│   │       ├── fetch_popular_movies_usecase.dart
│   │       ├── fetch_top_rated_movies_usecase.dart
│   │       └── fetch_upcoming_movies_usecase.dart
│   ├── main.dart
│   └── presentation
│       ├── pages
│       │   ├── movie_detail
│       │   │   ├── movie_detail_page.dart
│       │   │   └── movie_detail_view_model.dart
│       │   └── movie_list
│       │       ├── movie_list_page.dart
│       │       ├── movie_list_view_model.dart
│       │       └── widgets
│       │           ├── category_title.dart
│       │           └── movie_list.dart
│       ├── providers.dart
│       └── widgets
│           └── shimmer_loading_image.dart
└── test
    ├── core
    │   └── mock_data.dart
    ├── data
    │   ├── data_source
    │   │   ├── movie_data_source_impl_test.dart
    │   │   └── movie_data_source_test.dart
    │   ├── dto
    │   │   ├── movie_detail_dto_test.dart
    │   │   └── movie_response_dto_test.dart
    │   └── repository
    │       └── movie_repository_impl_test.dart
    └── domain
        └── usecase
            ├── movie_detail_usecase_test.dart
            └── movie_response_usecase_test.dart
```
---

## 🌟 사용된 기술 스택 및 라이브러리

- **[Riverpod](https://riverpod.dev/):** 상태 관리를 위한 강력한 라이브러리.
- **[TMDB API](https://www.themoviedb.org/documentation/api):** 영화 정보 제공.
- **[Shimmer](https://pub.dev/packages/shimmer):** 로딩 상태 UI 개선.
- **[Hero 애니메이션](https://flutter.dev/docs/development/ui/animations/hero-animations):** 페이지 전환 시 부드러운 애니메이션 제공.

---

## 🚀 트러블슈팅

### 문제: Hero 애니메이션 적용 중 비동기 데이터 로딩 문제 발생
**원인:** ConsumerWidget을 사용해 비동기 데이터를 처리하면서 Hero 애니메이션이 중단됨.  
**해결 방법:** ConsumerWidget 대신 StatefulWidget으로 전환하여 애니메이션을 정상적으로 구현.

더 자세한 내용은 [블로그 링크](#)에서 확인할 수 있습니다.

---

## 🧪 테스트

다양한 레이어에 대해 테스트 코드를 작성했습니다.
- 데이터 소스 테스트
- DTO 테스트
- 레포지토리 테스트
- UseCase 테스트

---
