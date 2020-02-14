import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treinamento_01/components/vehicles-list/vehicles-list.dart';

class SecondPage extends StatelessWidget {

  List vehiclesList = [
    {
      'firstLabel': 'Bellandur to Nandi Hills'
    },
    {
      'vehicle': 'Uber',
      'travel_duration': 25,
      'travel_cost': 65
    },
    {
      'vehicle': 'Taxi',
      'travel_duration': 10,
      'travel_cost': 85
    },
    {
      'vehicle': 'Public buss',
      'travel_duration': 34,
      'travel_cost': 100
    },
    {
      'vehicle': 'Uber',
      'travel_duration': 25,
      'travel_cost': 65
    },
    {
      'vehicle': 'Taxi',
      'travel_duration': 10,
      'travel_cost': 85
    },
    {
      'vehicle': 'Public buss',
      'travel_duration': 34,
      'travel_cost': 100
    },
    {
      'vehicle': 'Uber',
      'travel_duration': 25,
      'travel_cost': 65
    },
    {
      'vehicle': 'Taxi',
      'travel_duration': 10,
      'travel_cost': 85
    },
    {
      'vehicle': 'Public buss',
      'travel_duration': 34,
      'travel_cost': 100
    }
  ];

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _renderSecondPageBody(context),
    );
  }

  Widget _renderSecondPageBody(BuildContext context) {
    return (
      Container(
        padding: EdgeInsets.only(left: 40, right: 40, top: 50),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            this.renderHeader(context),

            this.renderListView()            
          ],
        ),
      )
    );
  }

  Widget renderHeader(BuildContext context) {

    return(
      Container(
        height: 50,

        margin: EdgeInsets.only(bottom: 20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            FlatButton(
              child: SvgPicture.asset(
                'assets/svg/back-arrow.svg',
                width: 15,
                height: 15,
              ),

              onPressed: () => _goBack(context),
            ),
            
            FlatButton(
              child: SvgPicture.asset(
                'assets/svg/config.svg',
                width: 25,
                height: 25,
                color: Colors.red,
              ),

              onPressed: () {},
            ),
          ],
        ),
      )
      
    );

  }

  Widget renderListView() {
    return (
      Expanded(
        child: VehiclesList(
          vehicles: this.vehiclesList
        )
      )
      
    );
  }

}
