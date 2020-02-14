import 'package:unit_converter/models/unit.dart';

class UnitGroup {

  String name;
  String imagePath;
  List<Unit> units;

  UnitGroup(this.name, this.imagePath, this.units);

  UnitGroup.fromJson(Map jsonMap) 
    : assert(jsonMap['name'] != null),
      this.name = jsonMap['name'],
      this.units = jsonMap['units'];

}
