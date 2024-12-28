import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../core/mock_data.dart';

class MockMovieDataSource extends Mock implements MovieDataSource {}

void main() {
  late MockMovieDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockMovieDataSource();
  });
  final mockMovieResponseDto = MockData.mockMovieResponseDto;
  final mockMovieDetailDto = MockData.mockMovieDetailDto;

  group('MovieDataSource Tests', () {
    test('MovieDataSource.fetchNowPlayingMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDataSource.fetchNowPlayingMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await mockDataSource.fetchNowPlayingMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.length, 1);
      expect(result.results.first.title, "Test Movie 1");
    });

    test('MovieDataSource.fetchPopularMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDataSource.fetchPopularMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await mockDataSource.fetchPopularMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.first.id, 1);
    });

    test('MovieDataSource.fetchTopRatedMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDataSource.fetchTopRatedMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await mockDataSource.fetchTopRatedMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.first.voteAverage, 8.5);
    });

    test('MovieDataSource.fetchUpcomingMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDataSource.fetchUpcomingMovies())
          .thenAnswer((_) async => mockMovieResponseDto);

      final result = await mockDataSource.fetchUpcomingMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.totalResults, 1);
    });

    test('MovieDataSource.fetchMovieDetail : 올바른 타입을 반환하는지 테스트', () async {
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
