import 'package:contador_pessoas/screens/home/home-state.screen.dart';
import 'package:contador_pessoas/screens/home/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Contador de pessoas',

      home: HomeState()
    );
    
  }

}
