import 'package:flutter/material.dart';
import 'package:mdbapp/bloc/get_genre_bloc.dart';
import 'package:mdbapp/model/genre_model.dart';
import 'package:mdbapp/model/genre_response.dart';

//WIDGETS
import '../loading_widget.dart';
import '../error_widget.dart';

class Genres extends StatefulWidget {
  @override
  _GenresState createState() => _GenresState();
}

class _GenresState extends State<Genres> {

  @override
  void initState(){
    super.initState();
    genresBloc..getGenres();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genresBloc.subject.stream,
      builder: (BuildContext context, AsyncSnapshot<GenreResponse> snapshot){
        if(snapshot.hasData) {
          if( snapshot.data.error != null && snapshot.data.error.length > 0){
            return errorWidget( snapshot.data.error);
          }
          return genresWidget(context, snapshot.data );
        } else if( snapshot.hasError ) {
          return errorWidget( snapshot.error);
        } else {
          return loadingWidget();
        }
      },
    );
  }

  Widget genresWidget(BuildContext context, GenreResponse data) {
    List<GenreModel> genres = data.genres;


    if( genres.length == 0 ) {
      return Container(
        child: Text('No Genre'),
      );
    } else {
      
    }
  }
}