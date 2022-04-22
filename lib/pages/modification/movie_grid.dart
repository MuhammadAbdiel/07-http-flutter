import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/modification/movie_detail.dart';
import 'package:flutter_movie_app/pages/modification/movie_detail_grid.dart';
import 'package:flutter_movie_app/services/http_service.dart';

class MovieGrid extends StatefulWidget {
  final int gridCount;

  const MovieGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  State<MovieGrid> createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
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
      backgroundColor: const Color(0xff1D2027),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.gridCount,
            ),
            itemCount: (moviesCount == null) ? 0 : moviesCount,
            itemBuilder: (context, position) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => LayoutBuilder(
                          builder: (
                            BuildContext context,
                            BoxConstraints constraints,
                          ) {
                            if (constraints.maxWidth > 800) {
                              return MovieDetailGrid(
                                gridCount: widget.gridCount,
                                movie: movies[position],
                              );
                            } else {
                              return MovieDetail(
                                movie: movies[position],
                              );
                            }
                          },
                        ),
                      );
                      Navigator.push(context, route);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: widget.gridCount == 4
                                ? MediaQuery.of(context).size.width /
                                    widget.gridCount *
                                    0.8
                                : widget.gridCount == 3
                                    ? MediaQuery.of(context).size.width /
                                        widget.gridCount *
                                        0.7
                                    : MediaQuery.of(context).size.width /
                                        widget.gridCount *
                                        0.6,
                            height: widget.gridCount == 4
                                ? MediaQuery.of(context).size.width /
                                    widget.gridCount *
                                    0.5
                                : widget.gridCount == 3
                                    ? MediaQuery.of(context).size.width /
                                        widget.gridCount *
                                        0.4
                                    : MediaQuery.of(context).size.width /
                                        widget.gridCount *
                                        0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${movies[position].posterPath}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                movies[position].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/star.png',
                                      height: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    movies[position].voteAverage.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xffBABFC9),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
