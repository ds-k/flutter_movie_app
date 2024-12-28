import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchUpcomingMoviesUsecase {
  FetchUpcomingMoviesUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>?> execute() {
    return _movieRepository.fetchUpcomingMovies();
  }
}
