import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchMovieDetailUseCase {
  final MovieRepository _movieRepository;

  FetchMovieDetailUseCase(this._movieRepository);

  Future<MovieDetail?> execute(int id) {
    return _movieRepository.fetchMovieDetail(id);
  }
}
