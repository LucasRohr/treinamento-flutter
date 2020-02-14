import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorItem extends StatelessWidget {

  CalculatorItem({
    @required this.type,
    @required this.symbol,
    @required this.onPressed
  });

  final String type;
  final String symbol;
  final Function onPressed;

  Color getColorByType() {
    if(type == 'number') {
      return Color.fromRGBO(51, 51, 51, 1);
    }
  
    if(type == 'operator') {
      return Color.fromRGBO(255, 149, 0, 1);
    }

    return Color.fromRGBO(175, 175, 175, 1);
  }

  Color getButtonFontColor() {
    return type == 'special' ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed,

      child: Container(
        alignment: this.symbol != '0' ? Alignment.center : Alignment.centerLeft,

        padding: this.symbol == '0' ? EdgeInsets.only(left: 25) : null,

        width: this.symbol != '0' ? 70 : 175,
        height: 70,

        margin: EdgeInsets.only(bottom: 20),

        decoration: new BoxDecoration(
          color: this.getColorByType(),
          shape: this.symbol != '0' ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: this.symbol == '0' ? BorderRadius.all(Radius.circular(35)) : null
        ),

        child: Text(
          this.symbol,
          style: TextStyle(
            fontSize: 28,
            color: this.getButtonFontColor()
          ),
        ),
      ),
    );
  }

}
