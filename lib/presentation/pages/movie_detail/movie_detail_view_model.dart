import 'dart:async';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailViewModel
    extends AutoDisposeFamilyAsyncNotifier<MovieDetail, int> {
  @override
  FutureOr<MovieDetail> build(int arg) async {
    final movieDetail =
        await ref.read(fetchMovieDetailUseCaseProvider).execute(arg);
    if (movieDetail != null) {
      return movieDetail;
    } else {
      throw Exception("데이터를 불러오는 데에 실패했습니다.");
    }
  }
}

final movieDetailViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<MovieDetailViewModel, MovieDetail, int>(
  () => MovieDetailViewModel(),
);
