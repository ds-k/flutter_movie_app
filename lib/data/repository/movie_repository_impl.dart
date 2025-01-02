import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/entity/movie_videos.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);
  final MovieDataSource _movieDataSource;

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    try {
      final result = await _movieDataSource.fetchMovieDetail(id);
      {
        if (result != null) {
          return MovieDetail(
            id: result.id,
            title: result.title,
            overview: result.overview,
            releaseDate: result.releaseDate,
            voteAverage: result.voteAverage,
            voteCount: result.voteCount,
            budget: result.budget,
            genres: result.genres.map((genre) => genre.name).toList(),
            productionCompanyLogos: result.productionCompanies
                .map((company) => company.logoPath ?? "")
                .where((path) => path != "")
                .toList(),
            popularity: result.popularity,
            revenue: result.revenue,
            runtime: result.runtime,
            tagline: result.tagline,
          );
        }
      }
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    try {
      final result = await _movieDataSource.fetchNowPlayingMovies();
      if (result != null) {
        return result.results
            .map((movie) => Movie(
                  id: movie.id,
                  posterPath: movie.posterPath,
                ))
            .toList();
      }
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    try {
      final result = await _movieDataSource.fetchPopularMovies();
      if (result != null) {
        return result.results
            .map((movie) => Movie(
                  id: movie.id,
                  posterPath: movie.posterPath,
                ))
            .toList();
      }
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    try {
      final result = await _movieDataSource.fetchTopRatedMovies();
      if (result != null) {
        return result.results
            .map((movie) => Movie(
                  id: movie.id,
                  posterPath: movie.posterPath,
                ))
            .toList();
      }
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    try {
      final result = await _movieDataSource.fetchUpcomingMovies();
      if (result != null) {
        return result.results
            .map((movie) => Movie(
                  id: movie.id,
                  posterPath: movie.posterPath,
                ))
            .toList();
      }
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<MovieVideos?> fetchMovieVideos(int id) async {
    try {
      final result = await _movieDataSource.fetchMovieVideos(id);
      {
        if (result != null) {
          return MovieVideos(
            id: result.id,
            results: result.results
                .map((video) => Video(
                      name: video.name,
                      key: video.key,
                      site: video.site,
                      id: video.id,
                    ))
                .toList(),
          );
        }
      }
      return null;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
