import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';

import '../../core/mock_data.dart';

class MockMovieDataSource extends Mock implements MovieDataSource {}

void main() {
  late MovieRepositoryImpl movieRepositoryImpl;
  late MockMovieDataSource mockMovieDataSource;

  setUp(() {
    mockMovieDataSource = MockMovieDataSource();
    movieRepositoryImpl = MovieRepositoryImpl(mockMovieDataSource);
  });

  final mockMovieResponseDto = MockData.mockMovieResponseDto;

  final mockMovieDetailDto = MockData.mockMovieDetailDto;

  group('movieRepositoryImpl tests', () {
    test('fetchNowPlayingMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockMovieDataSource.fetchNowPlayingMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await movieRepositoryImpl.fetchNowPlayingMovies();

      expect(result, isA<List<Movie>>());
    });

    test('fetchPopularMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockMovieDataSource.fetchPopularMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await movieRepositoryImpl.fetchPopularMovies();

      expect(result, isA<List<Movie>>());
    });

    test('fetchTopRatedMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockMovieDataSource.fetchTopRatedMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await movieRepositoryImpl.fetchTopRatedMovies();

      expect(result, isA<List<Movie>>());
    });

    test('fetchUpcomingMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockMovieDataSource.fetchUpcomingMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await movieRepositoryImpl.fetchUpcomingMovies();

      expect(result, isA<List<Movie>>());
    });

    test('fetchMovieDetail : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockMovieDataSource.fetchMovieDetail(1))
          .thenAnswer((_) async => mockMovieDetailDto);

      final result = await movieRepositoryImpl.fetchMovieDetail(1);

      expect(result, isA<MovieDetail>());
    });
  });
}
