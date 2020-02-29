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

  final String placeholder;
  final TextInputType type;
  final Function onChanged;

  final TextEditingController controller;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: this.controller,

      validator: this.validator,

      onChanged: this.onChanged,

      keyboardType: this.type,

      cursorColor: Colors.blue[400],

      decoration: InputDecoration(

        labelText: this.placeholder,

        labelStyle: TextStyle(
          color: Colors.blue[400]
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[300]
          )
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[300]
          )
        ),

        focusColor: Colors.blue[300],

      ),

      textAlign: TextAlign.start

    );
  }

}
