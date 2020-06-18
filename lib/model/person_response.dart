

class PersonResponse{

  final List<PersonResponse> persons;
  final String error;

  PersonResponse(
    this.persons, 
    this.error
  );

  PersonResponse.fromJson(Map<String, dynamic> json)
  : persons = (json['results'] as List).map((i) => new PersonResponse.fromJson(i)).toList(),
    error ='';

  PersonResponse.withError(String errorValue)
  : persons = List(),
    error = errorValue;

}