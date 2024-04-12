import 'package:dartz/dartz.dart';
import 'package:movie_recommendation/core/server_failure.dart';
import 'package:movie_recommendation/domain/entities/Movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
}
