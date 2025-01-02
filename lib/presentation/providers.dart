import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movie_videos_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_upcoming_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Dio를 제공하는 Provider
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3/movie/",
    headers: {
      "Authorization":
          "Bearer ${const String.fromEnvironment("TMDB_ACCESS_TOKEN")}"
    },
  ));
  // dio.interceptors.add(PrettyDioLogger());
  return dio;
});

// MovieDataSource를 제공하는 Provider
final _movieDataSourceProvier = Provider<MovieDataSource>((ref) {
  return MovieDataSourceImpl(ref.read(dioProvider));
});

// MovieRepository를 제공하는 Provider
final _movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.read(_movieDataSourceProvier);
  return MovieRepositoryImpl(dataSource);
});

// ---------------------- useCase 처리 ----------------------

// FetchMovieDetailUseCase를 제공하는 Provider
final fetchMovieDetailUseCaseProvider =
    Provider<FetchMovieDetailUseCase>((ref) {
  final movieRepository = ref.read(_movieRepositoryProvider);
  return FetchMovieDetailUseCase(movieRepository);
});

// FetchNowPlayingMoviesUsecase를 제공하는 Provider
final fetchNowPlayingMoviesUsecaseProvider =
    Provider<FetchNowPlayingMoviesUsecase>((ref) {
  final movieRepository = ref.read(_movieRepositoryProvider);
  return FetchNowPlayingMoviesUsecase(movieRepository);
});

// FetchPopularMoviesUsecase를 제공하는 Provider
final fetchPopularMoviesUsecaseProvider =
    Provider<FetchPopularMoviesUsecase>((ref) {
  final movieRepository = ref.read(_movieRepositoryProvider);
  return FetchPopularMoviesUsecase(movieRepository);
});

// FetchTopRatedMoviesUsecase를 제공하는 Provider
final fetchTopRatedMoviesUsecaseProvider =
    Provider<FetchTopRatedMoviesUsecase>((ref) {
  final movieRepository = ref.read(_movieRepositoryProvider);
  return FetchTopRatedMoviesUsecase(movieRepository);
});

// FetchUpcomingMoviesUsecase를 제공하는 Provider
final fetchUpcomingMoviesUsecaseProvider =
    Provider<FetchUpcomingMoviesUsecase>((ref) {
  final movieRepository = ref.read(_movieRepositoryProvider);
  return FetchUpcomingMoviesUsecase(movieRepository);
});

final fetchMovieVideosUsecaseProvider =
    Provider<FetchMovieVideosUsecase>((ref) {
  final movieRepository = ref.read(_movieRepositoryProvider);
  return FetchMovieVideosUsecase(movieRepository);
});
