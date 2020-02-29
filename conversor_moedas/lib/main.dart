import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home/home.state.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Moedas',

      theme: ThemeData(
        primaryColor: Colors.yellowAccent[300],
        hintColor: Colors.amber,
        accentColor: Colors.amber,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide( color: Colors.amber ))
        )
      ),

      home: HomeState(),

    );
  }

}
