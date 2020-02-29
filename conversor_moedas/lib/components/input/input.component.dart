import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Input extends StatelessWidget {

  Input({
    @required this.placeholder,
    @required this.type,
    @required this.onChanged,
    @required this.controller,
    @required this.validator,
    @required this.prefixText
  });

  String placeholder;
  String prefixText;
  TextInputType type;
  Function onChanged;

  TextEditingController controller;
  Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: this.controller,

      cursorColor: Colors.amber,

      cursorRadius: Radius.circular(5),
      
      keyboardType: this.type,

      decoration: InputDecoration(
        
        labelText: this.placeholder,

        labelStyle: TextStyle(
          color: Colors.amber
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        ),

        focusColor: Colors.amber[300],

        prefixText: this.prefixText,

        prefixStyle: TextStyle(
          color: Colors.amber,
          fontSize: 18
        )

      ),

      cursorWidth: 2,

      textAlign: TextAlign.start,

      style: TextStyle(
        color: Colors.amber,
        fontSize: 18
      ),

      onChanged: this.onChanged,

      validator: this.validator,

    );
  }

}