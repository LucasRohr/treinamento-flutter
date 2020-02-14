import 'package:flutter/material.dart';
import 'package:treinamento_01/pages/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Color bottomNavTextColor = Color.fromRGBO(66, 67, 69, 1);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        // is not restarted.
        primaryColor: Colors.white,
        fontFamily: 'AvenirNext'
      ),

      home: Scaffold(
        body: Home(),

        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(
                Icons.check_circle_outline,
                color: Colors.grey,
              ),
              title: Text(
                'SEARCH',
                style: TextStyle(
                  color: bottomNavTextColor
                ),
              ),
            ),
  
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text(
                'BOOKINGS',
                style: TextStyle(
                  color: bottomNavTextColor
                ),
              ),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text(
                'ACCOUNT',
                style: TextStyle(
                  color: bottomNavTextColor
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}
