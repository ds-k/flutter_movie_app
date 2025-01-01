import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:flutter_movie_app/presentation/pages/movie_list/movie_list_view_model.dart';
import 'package:flutter_movie_app/presentation/pages/movie_list/widgets/category_title.dart';
import 'package:flutter_movie_app/presentation/pages/movie_list/widgets/movie_list.dart';
import 'package:flutter_movie_app/presentation/widgets/shimmer_loading_image.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListPage extends ConsumerWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieListState = ref.watch(movieListViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: movieListState.when(
          data: (movieListState) {
            final categories = [
              {
                'title': "가장 인기있는",
                'movies': movieListState.popularMoviesList ?? []
              },
              {
                'title': "현재 상영중",
                'movies': movieListState.nowPlayingMoviesList ?? []
              },
              {
                'title': "인기 순",
                'movies': movieListState.popularMoviesList ?? []
              },
              {
                'title': "평점 높은 순",
                'movies': movieListState.topRatedMoviesList ?? []
              },
              {
                'title': "개봉 예정",
                'movies': movieListState.upcomingMoviesList ?? []
              },
            ];

            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final movies = category['movies'] as List;

                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryTitle(title: category['title'] as String),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailPage(movie: movies[0]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: ShimmerLoadingImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500${movies[0].posterPath}",
                                width: double.infinity,
                                height: 480,
                              )),
                        ),
                      ),
                    ],
                  );
                } else if (index == 2) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryTitle(title: category['title'] as String),
                      MovieList(
                        movies: movies,
                        isPopularList: true,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryTitle(title: category['title'] as String),
                      MovieList(movies: movies),
                    ],
                  );
                }
              },
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          error: (error, stackTrace) {
            return Center(child: Text("Error: $error / on : $stackTrace"));
          },
        ), // Add your child widget here
      ),
    );
  }
}
