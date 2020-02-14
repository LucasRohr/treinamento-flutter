import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unit_converter/models/unit.dart';

class Dropdown extends StatelessWidget {

  final Function validator;
  final Function onSelected;
  final Unit selected;
  final String label;
  final List<Unit> unitsList;

  Dropdown({
    @required this.validator,
    @required this.onSelected,
    @required this.selected,
    @required this.label,
    @required this.unitsList,
  });

  @override
  Widget build(BuildContext context) {
    if(this.unitsList == null || this.unitsList.isEmpty) {
      return Container();
    }

    return (
      DropdownButtonFormField(
        validator: this.validator,

        items: this.unitsList.map((unit) => (
          DropdownMenuItem(
            value: unit,

            child: Text(unit.name),
          )
        )).toList(),

        onChanged: this.onSelected,
        
        value: this.selected != null ? this.selected : this.unitsList[0],

        decoration: InputDecoration(
          labelText: this.label,
        ),
      )
    );
  }

}
