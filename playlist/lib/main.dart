import 'package:flutter/material.dart';
import 'package:playlist/pages/home.state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playlist',
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: HomeState(),
    );
  }
}
