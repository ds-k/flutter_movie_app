import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_movie_app/presentation/widgets/shimmer_loading_image.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  final String categoryTitle;

  const MovieDetailPage({
    required this.movie,
    required this.categoryTitle,
    super.key,
  });

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: "${widget.categoryTitle} - ${widget.movie.id}",
              child: ShimmerLoadingImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/w500${widget.movie.posterPath}",
                width: double.infinity,
                height: 600,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final movieDetail =
                    ref.watch(movieDetailViewModelProvider(widget.movie.id));

                print("${widget.categoryTitle} - ${widget.movie.id} // 받는 쪽");

                return movieDetail.when(
                  data: (movieDetail) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(movieDetail.title),
                          Text(movieDetail.overview),
                        ],
                      ),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => const Text("에러가 발생했습니다."),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
