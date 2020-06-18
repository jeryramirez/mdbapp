import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mdbapp/model/movie_model.dart';
import 'package:mdbapp/model/movie_response.dart';

import 'package:page_indicator/page_indicator.dart';

import 'package:mdbapp/style/theme.dart' as Style;

Widget nowPlayingWidget(BuildContext context, MovieResponse data){
    
  List<MovieModel> movies = data.movies;
  if(movies.length == 0) {
    return Container (
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('No Movies')
        ],
      ),
    );
  } else {
    return Container(
      height: 220,
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        indicatorSpace: 8.0,
        padding: EdgeInsets.all(5.0),
        indicatorColor: Style.Colors.titleColor,
        indicatorSelectorColor: Style.Colors.secondColor,
        shape: IndicatorShape.circle(size: 6.0),
        pageView: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.take(10).length,
          itemBuilder: (context, index){
            return Stack (
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage('https://image.tmdb.org/t/p/original' + movies[index].backPoster),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Style.Colors.mainColor.withOpacity(1),
                        Style.Colors.mainColor.withOpacity(0.0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [
                        0.0,
                        0.5
                      ]
                    )
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Icon ( FontAwesomeIcons.playCircle, color: Style.Colors.secondColor, size: 40.0,),
                ),
                Positioned(
                  bottom: 30.0,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    width: 250.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movies[index].title,
                          style: TextStyle(
                            height: 1.5,
                            color:  Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,

                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        ),
        length: movies.take(10).length,
      ),
    );
  }

}