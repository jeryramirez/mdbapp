
import 'package:mdbapp/model/genre_model.dart';

class GenreResponse{

  final List<GenreModel> genres;
  final String error;

  GenreResponse(
    this.genres, 
    this.error
  );

  GenreResponse.fromJson(Map<String, dynamic> json)
  : genres = (json['results'] as List).map((i) => new GenreModel.fromJson(i)).toList(),
    error ='';

  GenreResponse.withError(String errorValue)
  : genres = List(),
    error = errorValue;

}