import 'package:dartz/dartz.dart';
import 'package:movie_recommendation/core/server_failure.dart';
import 'package:movie_recommendation/domain/entities/Movie.dart';
import 'package:movie_recommendation/domain/repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getTrendingMovies();
  }
}
