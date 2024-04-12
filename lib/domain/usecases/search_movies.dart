import 'package:dartz/dartz.dart';
import 'package:movie_recommendation/core/server_failure.dart';
import 'package:movie_recommendation/domain/entities/Movie.dart';
import 'package:movie_recommendation/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
