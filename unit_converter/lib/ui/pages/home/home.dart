import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unit_converter/models/unit-group.dart';
import 'package:unit_converter/models/unit.dart';
import 'package:unit_converter/services/currency.dart';
import 'package:unit_converter/ui/components/unit-row/unit_row.dart';

class Home extends State {

  List<UnitGroup> unitGroupsList = [];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.purple
  ];

  Widget renderUnitRow(context, index) {
    return (
      UnitRow(
        color: _baseColors[index],
        unitGroup: this.unitGroupsList[index]
      )
    );
  }

  void convertJsonToUnitGroupModel() async {
    final json = await DefaultAssetBundle.of(context)
      .loadString('assets/data/regular_units.json');

    final data = JsonDecoder().convert(json);

    final currencies = await Currency().getCurrencies();

    print(jsonDecode(currencies.data)['units']);

    data['Currency'] = jsonDecode(currencies.data)['units'];

    setState(() {
      data.forEach((category, key) => {

        this.unitGroupsList.add(
          UnitGroup(
            category,
            'assets/icons/${category.toString().toLowerCase()}.png',
            data[category].map<Unit>((jsonUnit) => Unit.fromJson(jsonUnit)).toList()
          )
        )

      });
    });
  }

  @override
  void initState() { 
    super.initState();
    this.convertJsonToUnitGroupModel();
  }

  @override
  Widget build(BuildContext context) {
    if(this.unitGroupsList.isEmpty) {
      return Container();
    }

    return Container(
        padding: EdgeInsets.only(top: 70, bottom: 50),

        child: ListView.builder(
          itemBuilder: this.renderUnitRow,
          itemCount: this.unitGroupsList.length,
        )
    );
  }

}
