import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/movie_detail/movie_detail_view_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailPage extends ConsumerWidget {
  final Movie movie;
  const MovieDetailPage({required this.movie, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(movieDetailViewModelProvider(movie.id));

    return Scaffold(
      body: Center(
        child: movieDetail.when(
          data: (movieDetail) {
            return Column(
              children: [
                Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}"),
                Text(movieDetail.title),
                Text(movieDetail.overview),
              ],
            );
          },
          loading: () => CircularProgressIndicator(),
          error: (error, stack) => Text("에러가 발생했습니다."),
        ),
      ),
    );
  }
}
