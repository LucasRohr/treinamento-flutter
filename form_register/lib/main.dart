import 'package:flutter/material.dart';
import 'package:form_register/home/home-state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form register',
      home: HomeState(),
    );
  }
}
