import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:movie_recommendation/presentation/pages/movies_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchMovie = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchMovie,
              decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        context
                            .read<SearchMoviesBloc>()
                            .add(FetchSearchMovies(_searchMovie.text));
                      },
                      child: Icon(Icons.search_outlined)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
            builder: (context, state) {
              if (state is SearchMoviesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchMoviesLoaded) {
                return MoviesList(movies: state.movies);
              } else if (state is SearchMoviesError) {
                return Text(state.message);
              }
              return Container();
            },
          )
        ],
      )),
    );
  }
}
