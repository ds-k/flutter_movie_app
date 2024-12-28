// mock_data.dart
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';

class MockData {
  /// [MovieResponseDto]의 mock 데이터
  static final mockMovieResponseDto = MovieResponseDto(
    dates: Dates(
      maximum: DateTime(2024, 12, 31),
      minimum: DateTime(2024, 12, 1),
    ),
    page: 1,
    results: [
      Result(
        adult: false,
        backdropPath: '/path1.jpg',
        genreIds: [28, 12],
        id: 1,
        originalLanguage: 'en',
        originalTitle: 'Test Movie 1',
        overview: 'This is a test movie.',
        popularity: 123.45,
        posterPath: '/poster1.jpg',
        releaseDate: DateTime(2024, 12, 1),
        title: 'Test Movie 1',
        video: false,
        voteAverage: 8.5,
        voteCount: 1000,
      ),
    ],
    totalPages: 1,
    totalResults: 1,
  );

  /// [MovieDetailDto]의 mock 데이터
  static final mockMovieDetailDto = MovieDetailDto(
    adult: false,
    backdropPath: '/path1.jpg',
    belongsToCollection: null,
    budget: 1000000,
    genres: [
      Genre(id: 28, name: 'Action'),
    ],
    homepage: 'http://example.com',
    id: 1,
    imdbId: 'tt1234567',
    originCountry: ['US'],
    originalLanguage: 'en',
    originalTitle: 'Test Movie 1',
    overview: 'This is a detailed description of the movie.',
    popularity: 123.45,
    posterPath: '/poster1.jpg',
    productionCompanies: [
      ProductionCompany(
        id: 1,
        logoPath: null,
        name: 'Test Studio',
        originCountry: 'US',
      ),
    ],
    productionCountries: [
      ProductionCountry(
        iso31661: 'US',
        name: 'United States',
      ),
    ],
    releaseDate: DateTime(2024, 12, 1),
    revenue: 5000000,
    runtime: 120,
    spokenLanguages: [
      SpokenLanguage(
        englishName: 'English',
        iso6391: 'en',
        name: 'English',
      ),
    ],
    status: 'Released',
    tagline: 'This is a tagline.',
    title: 'Test Movie 1',
    video: false,
    voteAverage: 8.5,
    voteCount: 1000,
  );
}
