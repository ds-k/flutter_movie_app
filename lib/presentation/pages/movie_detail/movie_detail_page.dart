import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_movie_app/presentation/widgets/shimmer_loading_image.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailPage extends ConsumerWidget {
  final Movie movie;
  final String categoryTitle;
  const MovieDetailPage(
      {required this.movie, required this.categoryTitle, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(movieDetailViewModelProvider(movie.id));

    print("$categoryTitle - ${movie.id} // 받는 쪽");
    return Scaffold(
      body: SafeArea(
        child: movieDetail.when(
          data: (movieDetail) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // ShimmerLoadingImage(
                  //   heroTag: "$categoryTitle - ${movie.id}",
                  //   imageUrl:
                  //       "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                  //   width: double.infinity,
                  //   height: 600,
                  // ),
                  Hero(
                    tag: "$categoryTitle - ${movie.id}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                        width: double.infinity,
                        height: 600,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(movieDetail.title),
                  Text(movieDetail.overview),
                ],
              ),
            );
          },
          loading: () => CircularProgressIndicator(),
          error: (error, stack) => Text("에러가 발생했습니다."),
        ),
      ),
    );
  }
}
