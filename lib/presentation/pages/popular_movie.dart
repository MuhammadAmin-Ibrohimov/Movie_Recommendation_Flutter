import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_recommendation/presentation/pages/movies_list.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          const Center(
            child: Text(
              'Popular Movies',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
            builder: (context, state) {
              if (state is PopularMoviesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PopularMoviesLoaded) {
                return MoviesList(movies: state.movies);
              } else if (state is PopularMoviesError) {
                return Text(state.message);
              }
              return Container();
            },
          ),
        ],
      )),
    );
  }
}
