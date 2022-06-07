class ApiDemo {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  ApiDemo({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  ApiDemo.fromJson(Map<String, dynamic> json) {
    page = json['page'];

    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((p) {
        results!.add(Results.fromJson(p));
      });
    }

    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Results {
  bool? adult;
  String? backdeopPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  // double? voteAverage;
  int? voteCount;

  Results({
    this.adult,
    this.backdeopPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    // this.voteAverage,
    this.voteCount,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdeopPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    // voteAverage =  double.parse(json['vote_average'].toString());
    voteCount = json['vote_count'];
  }
}

class CustomApiProvider<T> {
  int? statusCode;
  T? data;

  CustomApiProvider({this.statusCode, this.data});
}
