import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {

  final String title;
  final Color color;
  final Function onPressed;

  Button({
    @required this.title,
    @required this.color,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed,

      child: Container(
        alignment: Alignment.center,

        width: 85,
        height: 85,

        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[700],
            width: 3
          ),
          
          shape: BoxShape.circle,

          color: this.color
        ),

        child: Text(
          this.title,
          style: TextStyle(
            color: Color.fromRGBO(
              this.color.red + 80, this.color.green + 80, this.color.blue + 80, 1
            )
          ),
        ),
      ),
    );
  }

}
