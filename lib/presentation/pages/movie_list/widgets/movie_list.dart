import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:shimmer/shimmer.dart';

class MovieList extends StatelessWidget {
  final List movies;
  final bool isPopularList;

  const MovieList({
    required this.movies,
    this.isPopularList = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          if (!isPopularList) {
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
                  imageUrl:
                      "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                  width: 120,
                ),
              ),
            );
          } else {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(movie: movie),
                    ),
                  );
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ShimmerLoadingImage(
                      imageUrl:
                          "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                      width: 120,
                    ),
                    Positioned(
                        bottom: -20,
                        left: -20,
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ShimmerLoadingImage extends StatelessWidget {
  final String imageUrl;
  final double width;

  const ShimmerLoadingImage({
    required this.imageUrl,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _precacheImage(context, imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: width,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width,
                color: Colors.grey,
              ),
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
