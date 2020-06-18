
import 'package:mdbapp/model/person_response.dart';
import 'package:mdbapp/repository/movie_repository.dart';
import 'package:rxdart/subjects.dart';

class PersonsListBloc {

  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject = BehaviorSubject<PersonResponse>();

  getMovies(int id) async {

    PersonResponse response = await _repository.getPersons();
    _subject.sink.add(response);

  }

  dispose() async {

    _subject.close();
    
  }

  BehaviorSubject<PersonResponse> get subject => _subject;
  
}

final personBloc = PersonsListBloc();