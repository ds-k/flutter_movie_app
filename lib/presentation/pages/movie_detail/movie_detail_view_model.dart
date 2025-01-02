import 'dart:async';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/entity/movie_videos.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailState {
  final MovieDetail? movieDetail;
  final MovieVideos? movieVideos;

  MovieDetailState({this.movieDetail, this.movieVideos});
}

class MovieDetailViewModel
    extends AutoDisposeFamilyAsyncNotifier<MovieDetailState, int> {
  @override
  FutureOr<MovieDetailState> build(int arg) async {
    return await fetchMovieDetail(arg);
  }

  Future<MovieDetailState> fetchMovieDetail(int id) async {
    final movieDetail =
        await ref.read(fetchMovieDetailUseCaseProvider).execute(id);
    final movieVideos =
        await ref.read(fetchMovieVideosUsecaseProvider).execute(id);

    return MovieDetailState(movieDetail: movieDetail, movieVideos: movieVideos);
  }
}

final movieDetailViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<MovieDetailViewModel, MovieDetailState, int>(
  () => MovieDetailViewModel(),
);
