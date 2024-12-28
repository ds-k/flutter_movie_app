import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_upcoming_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository mockMovieRepository;
  late FetchNowPlayingMoviesUsecase fetchNowPlayingMoviesUsecase;
  late FetchPopularMoviesUsecase fetchPopularMoviesUsecase;
  late FetchTopRatedMoviesUsecase fetchTopRatedMoviesUsecase;
  late FetchUpcomingMoviesUsecase fetchUpcomingMoviesUsecase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    fetchNowPlayingMoviesUsecase =
        FetchNowPlayingMoviesUsecase(mockMovieRepository);
    fetchPopularMoviesUsecase = FetchPopularMoviesUsecase(mockMovieRepository);
    fetchTopRatedMoviesUsecase =
        FetchTopRatedMoviesUsecase(mockMovieRepository);
    fetchUpcomingMoviesUsecase =
        FetchUpcomingMoviesUsecase(mockMovieRepository);
  });

  final mockMovie = [
    Movie(
      id: 1,
      posterPath: '/poster1.jpg',
    )
  ];
  group("movieResponse UseCase tests", () {
    test("fetchNowPlayingMovies: execute가 올바른 데이터를 반환하는지 테스트", () async {
      when(() => mockMovieRepository.fetchNowPlayingMovies())
          .thenAnswer((_) async => mockMovie);

      final result = await fetchNowPlayingMoviesUsecase.execute();

      expect(result, isNotNull);
      expect(result, mockMovie);
    });

    test("fetchPopularMovies: execute가 올바른 데이터를 반환하는지 테스트", () async {
      when(() => mockMovieRepository.fetchPopularMovies())
          .thenAnswer((_) async => mockMovie);

      final result = await fetchPopularMoviesUsecase.execute();

      expect(result, isNotNull);
      expect(result, mockMovie);
    });

    test("fetchTopRatedMovies: execute가 올바른 데이터를 반환하는지 테스트", () async {
      when(() => mockMovieRepository.fetchTopRatedMovies())
          .thenAnswer((_) async => mockMovie);

      final result = await fetchTopRatedMoviesUsecase.execute();

      expect(result, isNotNull);
      expect(result, mockMovie);
    });

    test("fetchUpcomingMovies: execute가 올바른 데이터를 반환하는지 테스트", () async {
      when(() => mockMovieRepository.fetchUpcomingMovies())
          .thenAnswer((_) async => mockMovie);

      final result = await fetchUpcomingMoviesUsecase.execute();

      expect(result, isNotNull);
      expect(result, mockMovie);
    });
  });
}
