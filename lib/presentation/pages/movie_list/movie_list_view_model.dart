import 'dart:async';

import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListState {
  List<Movie>? nowPlayingMoviesList;
  List<Movie>? popularMoviesList;
  List<Movie>? topRatedMoviesList;
  List<Movie>? upcomingMoviesList;

  MovieListState({
    this.nowPlayingMoviesList,
    this.popularMoviesList,
    this.topRatedMoviesList,
    this.upcomingMoviesList,
  });
}

class MovieListViewModel extends AsyncNotifier<MovieListState> {
  @override
  FutureOr<MovieListState> build() async {
    return await fetchAllMovieList();
  }

  Future<MovieListState> fetchAllMovieList() async {
    try {
      final nowPlayingMoviesList =
          await ref.read(fetchNowPlayingMoviesUsecaseProvider).execute();

      final popularMoviesList =
          await ref.read(fetchPopularMoviesUsecaseProvider).execute();

      final topRatedMoviesList =
          await ref.read(fetchTopRatedMoviesUsecaseProvider).execute();

      final upcomingMoviesList =
          await ref.read(fetchUpcomingMoviesUsecaseProvider).execute();

      return MovieListState(
          nowPlayingMoviesList: nowPlayingMoviesList,
          popularMoviesList: popularMoviesList,
          topRatedMoviesList: topRatedMoviesList,
          upcomingMoviesList: upcomingMoviesList);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      return MovieListState();
    }
  }
}

final movieListViewModelProvider =
    AsyncNotifierProvider<MovieListViewModel, MovieListState>(
        () => MovieListViewModel());
