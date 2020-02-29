import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {

  Button({
    @required this.onPressed,
    @required this.title
  });

  Function onPressed;
  String title;

  @override
  Widget build(BuildContext context) {
    return (

      RaisedButton(

        onPressed: this.onPressed,
        
        color: Colors.blue[400],
        
        elevation: 5,

        textColor: Colors.white,

        padding: EdgeInsets.all(15),

        child: Text(this.title),
      
      )

    );
  }

}
