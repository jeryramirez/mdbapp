


import 'package:mdbapp/model/genre_response.dart';
import 'package:mdbapp/repository/movie_repository.dart';
import 'package:rxdart/subjects.dart';

class GenresBloc {

  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<GenreResponse> _subject = BehaviorSubject<GenreResponse>();

  getGenres() async {

    GenreResponse response = await _repository.getGenres();
    _subject.sink.add(response);

  }

  dispose() async {

    _subject.close();
    
  }

  BehaviorSubject<GenreResponse> get subject => _subject;
  
}

final genresBloc = GenresBloc();