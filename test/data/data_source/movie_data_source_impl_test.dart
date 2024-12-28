import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../core/mock_data.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MovieDataSourceImpl mockDataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    mockDataSource = MovieDataSourceImpl(mockDio);
  });

  final mockMovieResponseDto = MockData.mockMovieResponseDto;

  final mockMovieDetailDto = MockData.mockMovieDetailDto;

  group('MovieDataSourceImpl Tests', () {
    test('fetchNowPlayingMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDio.get(any(),
              queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(
                data: mockMovieResponseDto.toJson(),
                statusCode: 200,
                requestOptions: RequestOptions(path: '/now_playing'),
              ));

      final result = await mockDataSource.fetchNowPlayingMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.first.title, "Test Movie 1");
    });

    test('fetchPopularMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDio.get(any(),
              queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(
                data: mockMovieResponseDto.toJson(),
                statusCode: 200,
                requestOptions: RequestOptions(path: '/popular'),
              ));

      final result = await mockDataSource.fetchPopularMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.first.id, 1);
    });

    test('fetchTopRatedMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDio.get(any(),
              queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(
                data: mockMovieResponseDto.toJson(),
                statusCode: 200,
                requestOptions: RequestOptions(path: '/top_rated'),
              ));

      final result = await mockDataSource.fetchTopRatedMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.results.first.voteAverage, 8.5);
    });

    test('fetchUpcomingMovies : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDio.get(any(),
              queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(
                data: mockMovieResponseDto.toJson(),
                statusCode: 200,
                requestOptions: RequestOptions(path: '/upcoming'),
              ));

      final result = await mockDataSource.fetchUpcomingMovies();

      expect(result, isNotNull);
      expect(result, isA<MovieResponseDto>());
      expect(result!.totalResults, 1);
    });

    test('fetchMovieDetail : 올바른 타입을 반환하는지 테스트', () async {
      when(() => mockDio.get(any(),
              queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(
                data: mockMovieDetailDto.toJson(),
                statusCode: 200,
                requestOptions: RequestOptions(path: '/1'),
              ));

      final result = await mockDataSource.fetchMovieDetail(1);

      expect(result, isNotNull);
      expect(result, isA<MovieDetailDto>());
      expect(result!.title, "Test Movie 1");
      expect(result.genres.first.name, "Action");
    });
  });
}
