import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_videos_dto.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio _client;

  // Dio를 주입받는 생성자 추가
  MovieDataSourceImpl(this._client);

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final response = await _client.get("$id", queryParameters: {
        "language": "ko-KR",
      });
      if (response.statusCode == 200) {
        return MovieDetailDto.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    try {
      final response = await _client.get(
        "now_playing",
        queryParameters: {
          "language": "ko-KR",
          "page": "1",
        },
      );

      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    try {
      final response = await _client.get(
        "popular",
        queryParameters: {
          "language": "ko-KR",
          "page": "1",
        },
      );
      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(response.data);
      }
      return null;
    } catch (e, stac) {
      print((e, stac));
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    try {
      final response = await _client.get(
        "top_rated",
        queryParameters: {
          "language": "ko-KR",
          "page": "1",
        },
      );
      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    try {
      final response = await _client.get(
        "upcoming",
        queryParameters: {
          "language": "ko-KR",
          "page": "1",
        },
      );
      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

// https://api.themoviedb.org/3/movie/{movie_id}/videos
  @override
  Future<MovieVideosDto?> fetchMovieVideos(int id) async {
    try {
      final response = await _client.get("$id/videos");
      if (response.statusCode == 200) {
        return MovieVideosDto.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
