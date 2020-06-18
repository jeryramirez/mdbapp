import 'package:flutter/material.dart';

Widget errorWidget( String error ){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Error occurred: $error')
      ],
    ),
  );
}