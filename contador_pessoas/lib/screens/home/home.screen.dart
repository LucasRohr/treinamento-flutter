import 'package:contador_pessoas/screens/home/home-state.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends State<HomeState> {

  int peopleCounter = 0;

  void changeCounter(delta) {
    setState(() {
      this.peopleCounter += delta;
    });
  }

  String returnMessage() {

    if(this.peopleCounter > 10) {
      return 'Casa cheia!';
    } else if (this.peopleCounter < 0) {
      return 'Upside down';
    }
    return 'Pode entrar!';

  }

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[

        Image.asset(
          'assets/images/restaurant.jpg',
          fit: BoxFit.cover,
          height: 1000,
        ),
        
        Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Text(
              'Pessoas: ${this.peopleCounter}',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 10),
                  Shadow(color: Colors.black, blurRadius: 10),
                  Shadow(color: Colors.black, blurRadius: 10),
                  Shadow(color: Colors.black, blurRadius: 10)
                ]
              ),
            ),

            Padding(
              padding: EdgeInsets.all(25),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[

                  FlatButton(

                    child: Text(
                      '+1', 
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        shadows: [
                          Shadow(color: Colors.black, blurRadius: 10),
                          Shadow(color: Colors.black, blurRadius: 10),
                          Shadow(color: Colors.black, blurRadius: 10),
                          Shadow(color: Colors.black, blurRadius: 10)
                        ]
                      )
                
                    ),

                    onPressed: () => this.changeCounter(1),

                  ),

                  FlatButton(

                    child: Text(
                      '-1', 
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        shadows: [
                          Shadow(color: Colors.black, blurRadius: 10),
                          Shadow(color: Colors.black, blurRadius: 10),
                          Shadow(color: Colors.black, blurRadius: 10),
                          Shadow(color: Colors.black, blurRadius: 10)
                        ]
                      )
                
                    ),

                    onPressed: () => this.changeCounter(-1),

                  )

                ],

              ),
            ),

            Text(
              this.returnMessage(),
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal,
                fontSize: 30,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 10),
                  Shadow(color: Colors.black, blurRadius: 10),
                  Shadow(color: Colors.black, blurRadius: 10),
                  Shadow(color: Colors.black, blurRadius: 10)
                ]
              ),
            )

          ],

        )
      ],

    );
  }

}
