import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:flutter_movie_app/presentation/widgets/shimmer_loading_image.dart';

class MovieList extends StatelessWidget {
  final List movies;
  final bool isPopularList;
  final String categoryTitle;

  const MovieList({
    required this.movies,
    this.isPopularList = false,
    required this.categoryTitle,
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
                  print("$categoryTitle - ${movie.id} // 보내는쪽");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                        movie: movie,
                        categoryTitle: categoryTitle,
                      ),
                    ),
                  );
                },
                // child: ShimmerLoadingImage(
                //   heroTag: "$categoryTitle - ${movie.id}",
                //   imageUrl:
                //       "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                //   width: 120,
                //   height: 180,
                // ),
                child: Hero(
                  tag: "$categoryTitle - ${movie.id}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                      width: 120,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
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
                      builder: (context) => MovieDetailPage(
                        movie: movie,
                        categoryTitle: categoryTitle,
                      ),
                    ),
                  );
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // ShimmerLoadingImage(
                    //   heroTag: "$categoryTitle - ${movie.id}",
                    //   imageUrl:
                    //       "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                    //   width: 120,
                    //   height: 180,
                    // ),
                    Hero(
                      tag: "$categoryTitle - ${movie.id}",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
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
