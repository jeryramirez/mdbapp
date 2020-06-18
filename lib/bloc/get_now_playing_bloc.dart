


import 'package:mdbapp/model/movie_response.dart';
import 'package:mdbapp/repository/movie_repository.dart';
import 'package:rxdart/subjects.dart';

class NowPlayingListBloc {

  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getMovies(int id) async {

    MovieResponse response = await _repository.getPlayingMovies();
    _subject.sink.add(response);

  }

  dispose() async {

    _subject.close();
    
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
  
}

final nowPlayingMoviesBloc = NowPlayingListBloc();