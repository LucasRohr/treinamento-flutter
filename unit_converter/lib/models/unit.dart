class Unit {

  String name;
  double conversion;
  bool isBaseUnit;

  Unit(this.name, this.conversion, this.isBaseUnit);

  Unit.fromJson(Map jsonMap) 
    : assert(jsonMap['name'] != null),
      this.name = jsonMap['name'],
      this.conversion = jsonMap['conversion'],
      this.isBaseUnit = jsonMap['isBaseUnit'] != null ? jsonMap['isBaseUnit'] : false;
  

}
