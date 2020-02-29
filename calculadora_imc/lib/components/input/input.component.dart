import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Input extends StatelessWidget {

  Input({
    @required this.placeholder,
    @required this.type,
    @required this.onChanged,
    @required this.controller,
    @required this.validator
  });

  String placeholder;
  TextInputType type;
  Function onChanged;

  TextEditingController controller;
  Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: this.controller,

      cursorColor: Colors.green,

      cursorRadius: Radius.circular(5),
      
      keyboardType: this.type,

      decoration: InputDecoration(
        
        labelText: this.placeholder,

        labelStyle: TextStyle(
          color: Colors.green
        ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green
          )
        ),

        focusColor: Colors.green[300]

      ),

      cursorWidth: 2,

      textAlign: TextAlign.center,

      style: TextStyle(
        color: Colors.green,
        fontSize: 18
      ),

      onChanged: this.onChanged,

      validator: this.validator,

    );
  }

}