import 'package:flutter/material.dart';
import 'package:movie_recommendation/domain/entities/Movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 600,
            child: Ink.image(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                color: Colors.transparent,
                elevation: 8,
                child: Text(
                  movie.title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: AutofillHints.countryName,
                      color: Color.fromARGB(255, 205, 189, 189),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
