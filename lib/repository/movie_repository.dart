import 'package:dio/dio.dart';
import 'package:mdbapp/model/genre_response.dart';
import 'package:mdbapp/model/movie_response.dart';
import 'package:mdbapp/model/person_response.dart';


class MovieRepository {
  final String apiKey = '668f6a9c5378c044a903f499d51e6ce8';

  static String mainUrl = 'http:api.themoviedb.org/3';

  final Dio _dio = new Dio();

  var getPopularityUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGendersUrl = '$mainUrl/genre/list';
  var getPeronsUrl = '$mainUrl/trending/person/week';

  Future<MovieResponse> getMovies() async {

    var parameters = {
      'api_key' : apiKey,
      'language' : 'en-US',
      'page': 1
    };

    try {

      Response response = await _dio.get(getPopularityUrl, queryParameters: parameters);
      return MovieResponse.fromJson(response.data);

    } catch(error, stacktrace){

      print('Exception occurred: $error stackTrace: $stacktrace');
      return MovieResponse.withError('$error');

    }

  }

  Future<MovieResponse> getPlayingMovies() async {

    var parameters = {
      'api_key' : apiKey,
      'language' : 'en-US',
      'page': 1
    };

    try {

      Response response = await _dio.get(getPlayingUrl, queryParameters: parameters);
      return MovieResponse.fromJson(response.data);

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

      Response response = await _dio.get(getGendersUrl, queryParameters: parameters);
      return GenreResponse.fromJson(response.data);

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

      Response response = await _dio.get(getPeronsUrl, queryParameters: parameters);
      return PersonResponse.fromJson(response.data);

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

      Response response = await _dio.get(getMoviesUrl, queryParameters: parameters);
      return MovieResponse.fromJson(response.data);

    } catch(error, stacktrace){

      print('Exception occurred: $error stackTrace: $stacktrace');
      return MovieResponse.withError('$error');

    }

  }

}