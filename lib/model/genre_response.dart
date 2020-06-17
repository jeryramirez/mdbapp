
import 'package:mdbapp/model/genre_model.dart';

class GenreResponse{

  final List<GenreModel> movies;
  final String error;

  GenreResponse(
    this.movies, 
    this.error
  );

  GenreResponse.fromJson(Map<String, dynamic> json)
  : movies = (json['results'] as List).map((i) => new GenreModel.fromJson(i)).toList(),
    error ='';

  GenreResponse.withError(String errorValue)
  : movies = List(),
    error = errorValue;

}