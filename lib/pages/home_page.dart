// import 'package:flutter_movie_app/pages/movie_list.dart';
import 'package:flutter_movie_app/pages/modification/movie_grid.dart';
import 'package:flutter_movie_app/pages/modification/movie_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return const MovieList();
        } else if (constraints.maxWidth <= 900) {
          return const MovieGrid(gridCount: 2);
        } else if (constraints.maxWidth <= 1400) {
          return const MovieGrid(gridCount: 3);
        } else {
          return const MovieGrid(gridCount: 4);
        }
      },
    );
  }
}
