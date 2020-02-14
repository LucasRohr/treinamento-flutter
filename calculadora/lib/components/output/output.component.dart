import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Output extends StatelessWidget {

  Output({
    @required this.firstValue,
    @required this.secondValue,
    @required this.operation,
    @required this.result,
    @required this.isClear
  });

  int firstValue;
  int secondValue;
  String operation;
  String result;
  bool isClear;

  String returnFirstValue() {
    return this.firstValue != null ? this.firstValue.toString() : '';
  }

  String returnOperation() {
    return this.operation != null && this.operation != 'AC' ? this.operation : '';
  }

  String returnSecondValue() {
    return this.secondValue != null ? this.secondValue.toString() : '';
  }

  String getResult() {
    if(this.isClear) {
      return '0';
    }

    return this.result == null ? '${this.returnFirstValue()} ${this.returnOperation()} ${this.returnSecondValue()}' : this.result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),

      alignment: Alignment.bottomRight,
      color: Colors.black,

      child: Text(
        this.getResult(),
        style: TextStyle(
          fontSize: 75,
          color: Colors.white
        ),
      ),
    );
  }

}
