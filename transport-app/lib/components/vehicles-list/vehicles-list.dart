import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:treinamento_01/components/vehicles-list/list-item/list-item.dart';

class VehiclesList extends StatelessWidget {

  VehiclesList({
    @required this.vehicles
  });
  
  final List vehicles;

  Widget renderFirstItem() {
    return (
      Container(
        alignment: Alignment.centerLeft,

        margin: EdgeInsets.only(bottom: 60),

        child: Text(
          this.vehicles[0]['firstLabel'],
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        )
      )
    );
  }

  Widget renderListItem(context, index) {
    if(index == 0) {
      return renderFirstItem();
    }

    return (
      ListItem(
        index: index,
        list: this.vehicles,
        item: this.vehicles[index]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),

      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 15),
        itemCount: this.vehicles.length,
        itemBuilder: this.renderListItem
      )
    );
  }  

}
