import 'package:flutter/material.dart';
// import 'package:flutter_movie_app/pages/movie_list.dart';
import 'package:flutter_movie_app/pages/modification/movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MovieList();
  }
}
