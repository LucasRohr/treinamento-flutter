import 'dart:math';

import 'package:calculadora_imc/components/input/input.component.dart';
import 'package:calculadora_imc/screens/home/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeState extends State<HomeScreen> {

  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String imcMessage = 'Informe seus dados!';

  void setarPeso(double peso) {
    setState(() {
      this.weightController.text = peso.toString();
    });
  }

  void setarAltura(double altura) {
    setState(() {
      this.heightController.text = altura.toString();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        
        centerTitle: true,

        backgroundColor: Colors.green,

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: this.refreshFields,
          )
        ],
      ),

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Form(
          key: this.formKey,

          child: this.returnBody(),
        )
      )
    );
  }

  void refreshFields() {
    setState(() {
      this.weightController.text = '';
      this.heightController.text = '';
      this.imcMessage = 'Informe seus dados!';
      this.formKey = GlobalKey<FormState>();
    });
  }

  String validatorWeight(String value) {
    return value.isEmpty ? 'Insira seu peso!' : null;
  }

  String validatorHeight(String value) {
    return value.isEmpty ? 'Insira sua altura!' : null;
  }

  void calculateIMC() {
    double weight = double.parse(this.weightController.text);
    double height = double.parse(this.heightController.text) / 100;

    double imc = weight / (pow(height, 2));

    setState(() {
      if(imc < 18.6) {
        this.imcMessage = 'Abaixo do peso - IMC ${imc.toStringAsPrecision(4)}';
      } else if(imc >= 18.6 && imc <= 24.9) {
        this.imcMessage = 'Peso ideal - IMC ${imc.toStringAsPrecision(4)}';
      } else {
        this.imcMessage = 'Acima do peso - IMC ${imc.toStringAsPrecision(4)}';
      }
    });
  }

  void verifyFieldsToCalculate() {
    if(this.formKey.currentState.validate()) {
      this.calculateIMC();
    }
  }

  Widget returnBody() {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[

        Icon(
          Icons.person_outline, 
          color: Colors.green,
          size: 130,
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 30),

          child: Column(children: <Widget>[

            Padding(
              padding: EdgeInsets.only(bottom: 15),

              child: Input(
                placeholder: 'Digite seu peso (Kg)',

                type: TextInputType.number,

                onChanged: (weight) => this.setarPeso(weight),

                controller: this.weightController,

                validator: (weight) => this.validatorWeight(weight)
              )
            ),

            Input(
              placeholder: 'Digite sua altura (cm)',

              type: TextInputType.number,

              onChanged: (height) => this.setarAltura(height),

              controller: this.heightController,

              validator: (height) => this.validatorHeight(height)
            ),

          ],),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 25),

          child: RaisedButton(

            padding: EdgeInsets.all(12),

            child: Text(
              'Calcular',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ),

            onPressed: this.verifyFieldsToCalculate,

            color: Colors.green,

          )

        ),

        Text(
          this.imcMessage,

          style: TextStyle(
            color: Colors.green,
            fontSize: 25
          ),

          textAlign: TextAlign.center
        )

      ],

    );
  }

}
