import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/movie_detail.dart';
import 'package:flutter_movie_app/services/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List movies = [];
  HttpService? service;

  Future initialize() async {
    movies = [];
    movies = await service!.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: (moviesCount == null) ? 0 : moviesCount,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => MovieDetail(
                    movie: movies[position],
                  ),
                );
                Navigator.push(context, route);
              },
              child: Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${movies[position].posterPath}',
                  ),
                  title: Text(movies[position].title),
                  subtitle: Text(
                    'Rating = ${movies[position].voteAverage.toString()}',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
