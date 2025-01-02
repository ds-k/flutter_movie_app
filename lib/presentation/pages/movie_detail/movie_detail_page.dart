import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
              final movieDetailState =
                  ref.watch(movieDetailViewModelProvider(widget.movie.id));

              return movieDetailState.when(
                data: (movieDetailState) {
                  final movieInfo = [
                    {
                      "title": "평점",
                      "value":
                          movieDetailState.movieDetail!.voteAverage.toString(),
                    },
                    {
                      "title": "평점투표수",
                      "value":
                          movieDetailState.movieDetail!.voteCount.toString(),
                    },
                    {
                      "title": "인기점수",
                      "value":
                          movieDetailState.movieDetail!.popularity.toString(),
                    },
                    {
                      "title": "예산",
                      "value": movieDetailState.movieDetail!.budget.toString(),
                    },
                    {
                      "title": "수익",
                      "value": movieDetailState.movieDetail!.revenue.toString(),
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
                              movieDetailState.movieDetail!.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat("yyyy-MM-dd").format(
                                  movieDetailState.movieDetail!.releaseDate),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movieDetailState.movieDetail!.tagline,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${movieDetailState.movieDetail!.runtime.toString()}분",
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
                            itemCount:
                                movieDetailState.movieDetail!.genres.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text(
                                    movieDetailState.movieDetail!.genres[index],
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
                            child:
                                Text(movieDetailState.movieDetail!.overview)),
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
                        Container(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[700]!,
                              ),
                            ),
                          ),
                          height: 80,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movieDetailState
                                  .movieDetail!.productionCompanyLogos.length,
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
                                        'https://image.tmdb.org/t/p/w500${movieDetailState.movieDetail!.productionCompanyLogos[index]}',
                                        fit: BoxFit.contain),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "관련영상",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 400,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 16 / 9,
                            ),
                            itemCount:
                                movieDetailState.movieVideos!.results.length,
                            itemBuilder: (context, index) {
                              final video =
                                  movieDetailState.movieVideos!.results[index];

                              final videoLink = video.site == "YouTube"
                                  ? "https://www.youtube.com/watch?v=${video.key}"
                                  : "https://vimeo.com/${video.key}";

                              return GestureDetector(
                                onTap: () async {
                                  final uri = Uri.parse(videoLink);
                                  await launchUrl(uri);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(8)),
                                          child: Image.network(
                                            "https://img.youtube.com/vi/${video.key}/0.jpg",
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          video.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
