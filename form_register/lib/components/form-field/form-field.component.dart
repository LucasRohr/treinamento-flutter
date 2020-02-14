import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormFieldInput extends StatelessWidget {

  FormFieldInput({
    this.validator,
    @required this.label,
    @required this.type,
    @required this.maxInputLength,
    this.onChange
  });

  final Function validator;
  final String label;
  final TextInputType type;
  final Function onChange;
  final int maxInputLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),

      child: TextFormField(

        maxLength: this.maxInputLength,

        onChanged: this.onChange,

        keyboardType: this.type,
        decoration: InputDecoration(

          labelText: this.label,

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red,
                width: 1.0
              ),
          )

        ),

        validator: this.validator,

      )
    );
  }

}
