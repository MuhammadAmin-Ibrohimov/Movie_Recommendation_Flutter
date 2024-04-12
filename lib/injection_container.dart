import 'package:get_it/get_it.dart';
import 'package:movie_recommendation/data/datasource/movie_remote_datasource.dart';
import 'package:movie_recommendation/data/datasource/remote/movie_ramote_datasource_impl.dart';
import 'package:movie_recommendation/data/repositories/movie_repository_impl.dart';
import 'package:movie_recommendation/domain/repositories/movie_repository.dart';
import 'package:movie_recommendation/domain/usecases/get_popular_movies.dart';
import 'package:movie_recommendation/domain/usecases/get_trending_movie.dart';
import 'package:movie_recommendation/domain/usecases/search_movies.dart';
import 'package:movie_recommendation/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_recommendation/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:movie_recommendation/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));

  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));

  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));

  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: getIt()));

  getIt.registerLazySingleton(() => http.Client());
}
