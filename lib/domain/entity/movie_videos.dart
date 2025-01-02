class MovieVideos {
  final int id;
  final List<Video> results;

  MovieVideos({
    required this.id,
    required this.results,
  });
}

class Video {
  final String name;
  final String key;
  final String site;
  final String id;

  Video({
    required this.name,
    required this.key,
    required this.site,
    required this.id,
  });
}
