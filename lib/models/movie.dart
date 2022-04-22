class Movie {
  late int id;
  late String title;
  late double voteAverage;
  late String overview;
  late String posterPath;
  late String backdropPath;

  Movie({
    this.id = 0,
    this.title = '',
    this.voteAverage = 0,
    this.overview = '',
    this.posterPath = '',
    this.backdropPath = '',
  });

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    voteAverage = parsedJson['vote_average'] * 1.0;
    overview = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
    backdropPath = parsedJson['backdrop_path'];
  }
}
