import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:flutter_movie_app/presentation/pages/movie_list/movie_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class MovieListPage extends ConsumerWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieListState = ref.watch(movieListViewModelProvider);

    return Scaffold(
      body: movieListState.when(
        data: (movieListState) {
          final nowPlayingMovies = movieListState.nowPlayingMoviesList ?? [];
          final popularMovies = movieListState.popularMoviesList ?? [];
          final topRatedMovies = movieListState.topRatedMoviesList ?? [];
          final upcomingMovies = movieListState.upcomingMoviesList ?? [];

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "현재 상영중",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                movieList(
                  context: context,
                  movies: nowPlayingMovies,
                  title: "현재 상영중",
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "인기순",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                movieList(
                  context: context,
                  movies: popularMovies,
                  title: "인기순",
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "평점 높은순",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                movieList(
                  context: context,
                  movies: topRatedMovies,
                  title: "평점 높은순",
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "개봉 예정",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                movieList(
                  context: context,
                  movies: upcomingMovies,
                  title: "개봉 예정",
                ),
              ],
            ),
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          return Center(child: Text("Error: $error / on : $stackTrace"));
        },
      ),
    );
  }

  Widget movieList({
    required BuildContext context,
    required List movies,
    required String title,
  }) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: movie),
                  ),
                );
              },
              child: ShimmerLoadingImage(
                imageUrl: "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                width: 120,
                height: 180,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShimmerLoadingImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const ShimmerLoadingImage({
    required this.imageUrl,
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _precacheImage(context, imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: width,
              height: height,
              color: Colors.grey,
            ),
          );
        }
      },
    );
  }

  Future<void> _precacheImage(BuildContext context, String url) async {
    final image = NetworkImage(url);
    await precacheImage(image, context);
  }
}
