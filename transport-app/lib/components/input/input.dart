import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Input extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(

        hintText: 'Country',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(191, 207, 220, 1),
              width: 1.0
            ),
        ),

        suffixIcon: Icon(
          Icons.gps_fixed,
          color: Color.fromRGBO(191, 207, 220, 1),
        )

      ),

    );
  }

}
