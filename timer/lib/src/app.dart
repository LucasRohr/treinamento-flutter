import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timer/src/ui/pages/home/home.state.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeState(),
    );
  }

}