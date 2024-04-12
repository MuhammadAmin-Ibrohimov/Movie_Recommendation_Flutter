import 'package:movie_recommendation/domain/entities/Movie.dart';

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieModel(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
    };
  }

  Movie toEntity() {
    return Movie(
        id: id, title: title, overview: overview, posterPath: posterPath);
  }
}
