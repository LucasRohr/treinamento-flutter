import 'package:calculadora/components/calculator-item/calculator-item.component.dart';
import 'package:calculadora/components/output/output.component.dart';
import 'package:calculadora/models/calc-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends State {

  int firstValue;
  int secondValue;
  String operation;
  String result;
  bool isClear = false;

  List<CalcItem> calcItems = [
    CalcItem('AC', 'special'),
    CalcItem('+/-', 'special'),
    CalcItem('%', 'special'),

    CalcItem('÷', 'operator'),

    CalcItem('7', 'number'),
    CalcItem('8', 'number'),
    CalcItem('9', 'number'),

    CalcItem('X', 'operator'),

    CalcItem('4', 'number'),
    CalcItem('5', 'number'),
    CalcItem('6', 'number'),

    CalcItem('-', 'operator'),

    CalcItem('1', 'number'),
    CalcItem('2', 'number'),
    CalcItem('3', 'number'),

    CalcItem('+', 'operator'),

    CalcItem('0', 'number'),
    CalcItem(',', 'number'),
    CalcItem('=', 'operator'),
  ];

  void sum() {
    setState(() {
      int calc = this.firstValue + this.secondValue;
      this.result = calc.toString();
    });
  }

  void sub() {
    setState(() {
      int calc = this.firstValue - this.secondValue;
      this.result = calc.toString();
    });
  }

  void divide() {
    setState(() {
      double calc = this.firstValue / this.secondValue;
      this.result = calc.toStringAsFixed(2);
    });
  }

  void mult() {
    setState(() {
      int calc = this.firstValue * this.secondValue;
      this.result = calc.toString();
    });
  }

  void calculateResult() {
    if(this.operation == '÷' && this.secondValue == 0) {
      setState(() {
        this.result = 'Erro';
      });
    } else {
      switch (operation) {
        case '÷':
          this.divide();
          break;

        case '+':
          this.sum();
          break;

        case '-':
          this.sub();
          break;

        case 'X':
          this.mult();
          break;
        
        default:
          break;
      }
    }
  }

  void addButtonValueToOperation(value, type) {
    this.isClear = false;

    if(value == 'AC') {
      setState(() {
        this.isClear = true;
        this.firstValue = null;
        this.secondValue = null;
        this.result = null;
      });
    }

    if(type == 'number') {
      if(this.firstValue == null) {
        setState(() {
          this.firstValue = int.parse(value);
        });
      } else if(this.secondValue == null && this.operation != null) {
        setState(() {
          this.secondValue = int.parse(value);
        });
      }

    } else {
      if (value != '=') {
        setState(() {
          this.operation = value;
        });
      } else {
        this.calculateResult();
      }
    }
  }

  List<CalculatorItem> renderButtons() {
    List<CalculatorItem> items = [];

    calcItems.forEach((item) => {
      items.add(
        CalculatorItem(
          type: item.type,
          symbol: item.symbol,
          onPressed: () => this.addButtonValueToOperation(item.symbol, item.type),
        )
      )
    });

    return items;
  }

  Widget renderButtonsList() {
    return (
      Container(
        padding: EdgeInsets.only(top: 40, bottom: 15),
        alignment: Alignment.bottomCenter,

        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          direction: Axis.horizontal,

          children: this.renderButtons(),
        )
      )
    );
  }

  Widget renderHomeBody() {
    return Container(
      color: Colors.black,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Expanded(
            flex: 5,
            child: Output(
              firstValue: this.firstValue,
              secondValue: this.secondValue,
              operation: this.operation,
              result: this.result,
              isClear: this.isClear
            )
          ),

          Expanded(
            flex: 8,

            child: this.renderButtonsList(),
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: renderHomeBody(),
    );
  }

}
