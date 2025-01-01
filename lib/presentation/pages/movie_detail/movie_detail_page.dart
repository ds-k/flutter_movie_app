import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  final String categoryTitle;

  const MovieDetailPage({
    required this.movie,
    required this.categoryTitle,
    super.key,
  });

  @override
  MovieDetailPageState createState() => MovieDetailPageState();
}

class MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Hero(
            tag: "${widget.categoryTitle} - ${widget.movie.id}",
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${widget.movie.posterPath}",
              width: double.infinity,
              height: 600,
              fit: BoxFit.cover,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final movieDetail =
                  ref.watch(movieDetailViewModelProvider(widget.movie.id));

              return movieDetail.when(
                data: (movieDetail) {
                  final movieInfo = [
                    {
                      "title": "평점",
                      "value": movieDetail.voteAverage.toString(),
                    },
                    {
                      "title": "평점투표수",
                      "value": movieDetail.voteCount.toString(),
                    },
                    {
                      "title": "인기점수",
                      "value": movieDetail.popularity.toString(),
                    },
                    {
                      "title": "예산",
                      "value": movieDetail.budget.toString(),
                    },
                    {
                      "title": "수익",
                      "value": movieDetail.revenue.toString(),
                    },
                  ];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              movieDetail.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat("yyyy-MM-dd")
                                  .format(movieDetail.releaseDate),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movieDetail.tagline,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${movieDetail.runtime.toString()}분",
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: Colors.grey[700]!,
                              ),
                            ),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movieDetail.genres.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text(
                                    movieDetail.genres[index],
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.grey[700]!),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[700]!,
                                ),
                              ),
                            ),
                            child: Text(movieDetail.overview)),
                        const SizedBox(height: 8),
                        Text(
                          "흥행정보",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movieInfo.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey[700]!,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        movieInfo[index]["value"] as String,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        movieInfo[index]["title"] as String,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  movieDetail.productionCompanyLogos.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    width: 160,
                                    child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${movieDetail.productionCompanyLogos[index]}',
                                        fit: BoxFit.contain),
                                  ),
                                );
                              }),
                        ),
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
    );
  }
}
