part of 'search_movies_bloc.dart';

sealed class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchMovies extends SearchMoviesEvent {
  final String query;

  const FetchSearchMovies(this.query);
}
