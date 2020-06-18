import 'package:flutter/material.dart';
import 'package:mdbapp/model/genre_model.dart';

class GenresList extends StatefulWidget {
  //
  final List<GenreModel> genres;
  GenresList({Key key, @required this.genres}) : super(key: key);

  @override
  _GenresListState createState() => _GenresListState(genres);

}

class _GenresListState extends State<GenresList> with SingleTickerProviderStateMixin {

  //
  final List<GenreModel> genres;
  TabController _tabController;
  _GenresListState(this.genres);

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, length: genres.length);
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307.0,
      child: DefaultTabController(
        length: genres.length,
        child: Scaffold(
          
        ),
      ),
    );
  }
}