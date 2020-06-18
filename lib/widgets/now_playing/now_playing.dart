import 'package:flutter/material.dart';

import 'package:mdbapp/bloc/get_now_playing_bloc.dart';
import 'package:mdbapp/model/movie_response.dart';

//Widgets
import '../error_widget.dart';
import 'package:mdbapp/widgets/now_playing/now_playing_widget.dart';

import '../loading_widget.dart';

class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {

  @override
  void initState(){
    super.initState();
    nowPlayingMoviesBloc..getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: nowPlayingMoviesBloc.subject.stream ,
      builder: (BuildContext context, AsyncSnapshot<MovieResponse> snapshot){
        if(snapshot.hasData) {
          if( snapshot.data.error != null && snapshot.data.error.length > 0){
            return errorWidget( snapshot.data.error);
          }
          return nowPlayingWidget(context, snapshot.data );
        } else if( snapshot.hasError ) {
          return errorWidget( snapshot.error);
        } else {
          return loadingWidget();
        }
      },
    );
  }

}