import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Input extends StatelessWidget {

  final String placeholder;
  final Function onChanged;
  final Color colorTheme;
  final Function validator;
  final TextInputType type;
  final TextEditingController controller;

  Input({
    @required this.placeholder,
    @required this.onChanged,
    @required this.colorTheme,
    @required this.type,
    @required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,

      validator: this.validator,

      onChanged: this.onChanged,

      keyboardType: this.type,

      decoration: InputDecoration(
        labelText: this.placeholder,

        focusColor: this.colorTheme,

        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: this.colorTheme,
              width: 1.0
            ),
        )
      ),

      cursorColor: this.colorTheme,

    );
  }

}
