import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockMovieDataSource extends Mock implements MovieDataSourceImpl {}

void main() {
  late MockMovieDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockMovieDataSource();
  });

  final mockMovieResponseDto = MovieResponseDto(
    dates: Dates(
      maximum: DateTime(2024, 12, 31),
      minimum: DateTime(2024, 12, 1),
    ),
    page: 1,
    results: [
      Result(
        adult: false,
        backdropPath: '/path1.jpg',
        genreIds: [28, 12],
        id: 1,
        originalLanguage: 'en',
        originalTitle: 'Test Movie 1',
        overview: 'This is a test movie.',
        popularity: 123.45,
        posterPath: '/poster1.jpg',
        releaseDate: DateTime(2024, 12, 1),
        title: 'Test Movie 1',
        video: false,
        voteAverage: 8.5,
        voteCount: 1000,
      ),
    ],
    totalPages: 1,
    totalResults: 1,
  );

  final mockMovieDetailDto = MovieDetailDto(
    adult: false,
    backdropPath: '/path1.jpg',
    belongsToCollection: null,
    budget: 1000000,
    genres: [
      Genre(id: 28, name: 'Action'),
    ],
    homepage: 'http://example.com',
    id: 1,
    imdbId: 'tt1234567',
    originCountry: ['US'],
    originalLanguage: 'en',
    originalTitle: 'Test Movie 1',
    overview: 'This is a detailed description of the movie.',
    popularity: 123.45,
    posterPath: '/poster1.jpg',
    productionCompanies: [
      ProductionCompany(
        id: 1,
        logoPath: null,
        name: 'Test Studio',
        originCountry: 'US',
      ),
    ],
    productionCountries: [
      ProductionCountry(
        iso31661: 'US',
        name: 'United States',
      ),
    ],
    releaseDate: DateTime(2024, 12, 1),
    revenue: 5000000,
    runtime: 120,
    spokenLanguages: [
      SpokenLanguage(
        englishName: 'English',
        iso6391: 'en',
        name: 'English',
      ),
    ],
    status: 'Released',
    tagline: 'This is a tagline.',
    title: 'Test Movie 1',
    video: false,
    voteAverage: 8.5,
    voteCount: 1000,
  );
  group('MovieDataSourceImpl Tests', () {
    test('MovieDataSourceImpl.fetchNowPlayingMovies : 올바른 타입을 반환하는지 테스트',
        () async {
      when(() => mockDataSource.fetchNowPlayingMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await mockDataSource.fetchNowPlayingMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.length, 1);
      expect(result.results.first.title, "Test Movie 1");
    });

    test('MovieDataSourceImpl.fetchPopularMovies : 올바른 타입을 반환하는지 테스트',
        () async {
      when(() => mockDataSource.fetchPopularMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await mockDataSource.fetchPopularMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.first.id, 1);
    });

    test('MovieDataSourceImpl.fetchTopRatedMovies : 올바른 타입을 반환하는지 테스트',
        () async {
      when(() => mockDataSource.fetchTopRatedMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await mockDataSource.fetchTopRatedMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.first.voteAverage, 8.5);
    });

    test('MovieDataSourceImpl.fetchUpcomingMovies : 올바른 타입을 반환하는지 테스트',
        () async {
      when(() => mockDataSource.fetchUpcomingMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await mockDataSource.fetchUpcomingMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.totalResults, 1);
    });

    test('MovieDataSourceImpl.fetchMovieDetail : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDataSource.fetchMovieDetail(1))
          .thenAnswer((_) async => mockMovieDetailDto);

      final result = await mockDataSource.fetchMovieDetail(1);

      expect(result, isNotNull);
      expect(result, isA<MovieDetailDto>());
      expect(result!.title, "Test Movie 1");
      expect(result.genres.first.name, "Action");
    });
  });
}
