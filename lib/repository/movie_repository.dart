import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mdbapp/model/genre_response.dart';
import 'package:mdbapp/model/movie_response.dart';
import 'package:mdbapp/model/person_response.dart';


class MovieRepository {
  final String apiKey = '668f6a9c5378c044a903f499d51e6ce8';

  static String mainUrl = 'https://api.themoviedb.org/3';

  var getPopularityUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGendersUrl = '$mainUrl/genre/list';
  var getPeronsUrl = '$mainUrl/trending/person/week';

  Future<MovieResponse> getMovies() async {

    var parameters = {
      'api_key' : '668f6a9c5378c044a903f499d51e6ce8',
      'language' : 'en-US',
      'page': '1'
    };

    try {

      Response response = await http.get('$getPopularityUrl?api_key=668f6a9c5378c044a903f499d51e6ce8');
      return MovieResponse.fromJson(json.decode(response.body));

    } catch(error, stacktrace){

      print('Exception occurred: $error stackTrace: $stacktrace');
      return MovieResponse.withError('$error');

    }

  }

  Future<MovieResponse> getPlayingMovies() async {

    final parameters = {
      'api_key' : '668f6a9c5378c044a903f499d51e6ce8',
      'language' : 'en-US',
      'page': '1'
    };

    try {

      Response response = await http.get('$getPopularityUrl?api_key=668f6a9c5378c044a903f499d51e6ce8');
      return MovieResponse.fromJson(json.decode(response.body));

    } catch(error, stacktrace){

      print('Exception occurred: $error stackTrace: $stacktrace');
      return MovieResponse.withError('$error');

    }

  }

  Future<GenreResponse> getGenres() async {

    var parameters = {
      'api_key' : apiKey,
      'language' : 'en-US',
      'page': 1
    };

    try {

      final response = await http.get(getGendersUrl, headers: parameters);
      return GenreResponse.fromJson(response.headers);

    } catch(error, stacktrace){

      print('Exception occurred: $error stackTrace: $stacktrace');
      return GenreResponse.withError('$error');

    }

  }

  Future<PersonResponse> getPersons() async {

    var parameters = {
      'api_key' : apiKey,
    };

    try {

      Response response = await http.get(getPeronsUrl, headers: parameters);
      return PersonResponse.fromJson(response.headers);

    } catch(error, stacktrace){

      print('Exception occurred: $error stackTrace: $stacktrace');
      return PersonResponse.withError('$error');

    }

  }

  Future<MovieResponse> getMovieByGenre(int id) async {

    var parameters = {
      'api_key' : apiKey,
      'language' : 'en-US',
      'page': 1,
      'with_genres' : id
    };


    try {

      Response response = await http.get(getMoviesUrl, headers: parameters);
      return MovieResponse.fromJson(response.headers);

    } catch(error, stacktrace){

      print('Exception occurred: $error stackTrace: $stacktrace');
      return MovieResponse.withError('$error');

    }

  }

}