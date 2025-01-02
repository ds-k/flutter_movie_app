import 'package:flutter_movie_app/domain/entity/movie_videos.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchMovieVideosUsecase {
  final MovieRepository _movieRepository;

  FetchMovieVideosUsecase(this._movieRepository);

  Future<MovieVideos?> execute(int id) {
    return _movieRepository.fetchMovieVideos(id);
  }
}
