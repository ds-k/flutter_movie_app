import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository mockMovieRepository;
  late FetchMovieDetailUseCase fetchMovieDetailUseCase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    fetchMovieDetailUseCase = FetchMovieDetailUseCase(mockMovieRepository);
  });

  final mockMovieDetail = MovieDetail(
    id: 1,
    budget: 1000000,
    genres: ["Action", "Drama"],
    productionCompanyLogos: ["logo1.jpg", "logo2.jpg"],
    overview: "overview",
    popularity: 123.45,
    releaseDate: DateTime(2024, 12, 1),
    revenue: 5000000,
    runtime: 120,
    tagline: 'This is a tagline.',
    title: 'Test Movie 1',
    voteAverage: 8.5,
    voteCount: 1000,
  );

  test("fetchMovieDetail: execute가 올바른 데이터를 반환하는지 테스트", () async {
    when(() => mockMovieRepository.fetchMovieDetail(1))
        .thenAnswer((_) async => mockMovieDetail);

    final result = await fetchMovieDetailUseCase.execute(1);

    expect(result, isNotNull);
    expect(result, mockMovieDetail);
  });
}
