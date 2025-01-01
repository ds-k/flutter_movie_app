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
                'movies': movieListState.popularMoviesList ?? [],
                "prefix": "most_popular",
              },
              {
                'title': "현재 상영중",
                'movies': movieListState.nowPlayingMoviesList ?? [],
                "prefix": "now_playing",
              },
              {
                'title': "인기 순",
                'movies': movieListState.popularMoviesList ?? [],
                "prefix": "popular",
              },
              {
                'title': "평점 높은 순",
                'movies': movieListState.topRatedMoviesList ?? [],
                "prefix": "top_rated",
              },
              {
                'title': "개봉 예정",
                'movies': movieListState.upcomingMoviesList ?? [],
                "prefix": " upcoming",
              },
            ];

            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final movies = category['movies'] as List;
                final categoryTitle = category['prefix'] as String;

                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryTitle(title: categoryTitle),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailPage(
                                movie: movies[0],
                                categoryTitle: categoryTitle,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: ShimmerLoadingImage(
                                heroTag: "$categoryTitle - ${movies[0].id}",
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
                      CategoryTitle(title: categoryTitle),
                      MovieList(
                        categoryTitle: categoryTitle,
                        movies: movies,
                        isPopularList: true,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryTitle(title: categoryTitle),
                      MovieList(movies: movies, categoryTitle: categoryTitle),
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
