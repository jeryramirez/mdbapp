


import 'package:flutter/material.dart';
import 'package:mdbapp/model/movie_response.dart';
import 'package:mdbapp/repository/movie_repository.dart';
import 'package:rxdart/subjects.dart';

class MoviesListByGenreBloc {

  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getMoviesByGenre(int id) async {

    MovieResponse response = await _repository.getMovieByGenre(id);
    _subject.sink.add(response);

  }

  void drainStream() => _subject.value = null;
  @mustCallSuper
  void disponse() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
  
}

final moviesByGenreBloc = MoviesListByGenreBloc();