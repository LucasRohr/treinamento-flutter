import 'package:calculadora/pages/home.state.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomeState(),
    );
  }
}
