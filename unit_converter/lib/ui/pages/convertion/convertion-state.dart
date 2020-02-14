import 'package:flutter/widgets.dart';
import 'package:unit_converter/models/unit-group.dart';
import 'package:unit_converter/ui/pages/convertion/convertion.dart';

class ConvertionState extends StatefulWidget {

  final UnitGroup unitGroup;
  final Color colorTheme;

  ConvertionState({
    @required this.unitGroup,
    @required this.colorTheme
  });

  @override
  State<StatefulWidget> createState() => Convertion(unitGroup: this.unitGroup, colorTheme: this.colorTheme);

}
