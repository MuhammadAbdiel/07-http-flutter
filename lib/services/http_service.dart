// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter_movie_app/models/movie.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = '1a641cbf6e1dd166c45cd44c8fe2f840';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<dynamic> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print('Success');
      final jsonResponse = jsonDecode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print('Failure');
      return '';
    }
  }
}
