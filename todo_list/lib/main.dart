import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/home/home.page.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'TODO List',

      home: Home(),

      theme: ThemeData(

        primaryColor: Colors.red[400],
        accentColor: Colors.white,
        secondaryHeaderColor: Colors.white

      ),

    );
  }

}
