import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/models/unit-group.dart';
import 'package:unit_converter/models/unit.dart';
import 'package:unit_converter/services/currency.dart';
import 'package:unit_converter/ui/components/dropdown/dropdown.dart';
import 'package:unit_converter/ui/components/input/input.dart';

class Convertion extends State {

  UnitGroup unitGroup;
  Color colorTheme;

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController inputController = new TextEditingController();
  TextEditingController outputController = new TextEditingController();

  double input;
  Unit firstAreaUnit;
  double output;
  Unit secondAreaUnit;

  Convertion({
    @required this.unitGroup,
    @required this.colorTheme
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.unitGroup.name),
        centerTitle: true,
        backgroundColor: this.colorTheme,
      ),

      body: this.renderConvertionBody(),
    );
  }

  String validateInput(String input) {
    if(input.isEmpty) {
      return 'Você deve digitar uma entrada';
    }
    return null;
  }

  String validateSelectedFirstAreaUnit(firstAreaUnit) {
    if(firstAreaUnit == null) {
      return 'Você deve escolher uma primeira unidade';
    }
    return null;
  }

  String validateSelectedSecondAreaUnit(secondAreaUnit) {
    if(secondAreaUnit == null) {
      return 'Você deve escolher uma segunda unidade';
    }
    return null;
  }

  void handleInputChange(String input) {
    setState(() {
      this.input = double.parse(input);
    });
  }

  void handleOutputChange(String output) {
    setState(() {
      this.output = double.parse(output);
    });
  }

  void handleFirstAreaUnitSelection(firstAreaUnit) {
    setState(() {
      this.firstAreaUnit = firstAreaUnit;
    });
  }

  void handleSecondAreaUnitSelection(secondAreaUnit) {
    setState(() {
      this.secondAreaUnit = secondAreaUnit;
    });
  }

  void convertUnits() async {
    if(this.firstAreaUnit == null) {
      setState(() {
        this.firstAreaUnit = this.unitGroup.units[0];
      });
    }

    if(this.secondAreaUnit == null) {
      setState(() {
        this.secondAreaUnit = this.unitGroup.units[0];
      });
    }

    final convertionResponseOutput = await Currency().getConversion(
      this.firstAreaUnit.name, this.secondAreaUnit.name, this.input
    );

    final convertionResponseInput = await Currency().getConversion(
      this.secondAreaUnit.name, this.firstAreaUnit.name, this.output
    );

    setState(() {
      if(this.unitGroup.name != 'Currency') {
        double multOutput = (this.input * this.secondAreaUnit.conversion);
        this.outputController.text = (multOutput / (this.firstAreaUnit.conversion)).toString();

        double multInput = (this.output * this.firstAreaUnit.conversion);
        this.inputController.text = (multInput / (this.secondAreaUnit.conversion)).toString();
      } else {
        final responseOutput = jsonDecode(convertionResponseOutput.data)['conversion'];
        final responseInput = jsonDecode(convertionResponseInput.data)['conversion'];

        this.outputController.text = responseOutput != null ? responseOutput.toString() : '';

        this.inputController.text = responseInput != null ? responseInput.toString() : '';
      }
    });
  }

  void validateFields() {
    if(this.formKey.currentState.validate()) {
      this.convertUnits();
    }
  }

  Widget renderConvertionBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),

        child: Form(
          key: this.formKey,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[

              Container(

                padding: EdgeInsets.all(15),

                child: Column(
                  children: <Widget>[

                    Input(
                      controller: this.inputController,
                      validator: this.validateInput,
                      colorTheme: this.colorTheme,
                      placeholder: 'Input',
                      onChanged: this.handleInputChange,
                      type: TextInputType.numberWithOptions(decimal: true)
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 25, bottom: 20),

                      child: Dropdown(
                        label: 'Unidade de ${this.unitGroup.name} 1',
                        validator: this.validateSelectedFirstAreaUnit,
                        unitsList: this.unitGroup.units,
                        selected: this.firstAreaUnit,
                        onSelected: this.handleFirstAreaUnitSelection,
                      )
                    )

                  ],
                )
              ),

              Container(
                alignment: Alignment.center,

                margin: EdgeInsets.only(top: 15, bottom: 30),

                child: Icon(
                  Icons.compare_arrows,
                  size: 100,
                  color: this.colorTheme,
                ),
              ),

              Container(

                padding: EdgeInsets.all(15),

                child: Column(
                  children: <Widget>[

                    Input(
                      controller: this.outputController,
                      colorTheme: this.colorTheme,
                      placeholder: 'Output',
                      onChanged: this.handleOutputChange,
                      type: TextInputType.numberWithOptions(decimal: true)
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 25, bottom: 20),

                      child: Dropdown(
                          label: 'Unidade de ${this.unitGroup.name} 2',
                          validator: this.validateSelectedSecondAreaUnit,
                          unitsList: this.unitGroup.units,
                          selected: this.secondAreaUnit,
                          onSelected: this.handleSecondAreaUnitSelection,
                      )
                    )
                    
                  ],
                )
              ),

              Container(
                margin: EdgeInsets.only(top: 30, bottom: 25),

                child: RaisedButton(
                  onPressed: this.validateFields,
                  
                  padding: EdgeInsets.only(top: 15, bottom: 15),

                  color: this.colorTheme,

                  child: Text(
                    'Converter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                )
              )

            ],
          ),
        )
      )
    );
  }

}
