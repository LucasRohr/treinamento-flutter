import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimesList extends StatelessWidget {

  final List<String> timesList;

  TimesList({
    @required this.timesList
  });

  Widget renderListItem(context, index) {
    return (
      Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.only(left: 30, right: 30),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            Text(
              'Volta ${index + 1}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),

            Text(
              this.timesList[index],
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            )
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.timesList.length,
      itemBuilder: this.renderListItem
    );
  }

}
