import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItem extends StatelessWidget {

  ListItem({
    @required this.item,
    @required this.list,
    @required this.index
  });

  Map item;
  List list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),

      margin: EdgeInsets.only(bottom: index == list.length - 1 ? 70 : 15),

      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color.fromRGBO(191, 207, 220, 1)),
          left: BorderSide(width: 1.0, color: Color.fromRGBO(191, 207, 220, 1)),
          right: BorderSide(width: 1.0, color: Color.fromRGBO(191, 207, 220, 1)),
          bottom: BorderSide(width: 1.0, color: Color.fromRGBO(191, 207, 220, 1)),
        ),

        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),

      child: ListTile(
        onTap: () {},
        
        leading: Image.asset(
          'assets/images/grey-circle.png',
          scale: 0.8,
        ),

        title: Text(
          this.item['vehicle'],
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),
        ),

        subtitle: Text(
          '${this.item['travel_duration']} min journey',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black
          ),
        ),

        trailing: Text(
          '₹ ${this.item['travel_cost']}',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        )

      ),

    );
  }

}
