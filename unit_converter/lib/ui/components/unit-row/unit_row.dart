import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unit_converter/models/unit-group.dart';
import 'package:unit_converter/ui/pages/convertion/convertion-state.dart';

class UnitRow extends StatelessWidget {

  UnitRow({
    @required this.color,
    @required this.unitGroup
  });

  final Color color;
  final UnitGroup unitGroup;

  void pushToConvertionPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConvertionState(unitGroup: this.unitGroup, colorTheme: this.color,))
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => this.pushToConvertionPage(context),

      child: Container(
        width: double.infinity,
        height: 100,

        child: Material(
          child: InkWell(
            onTap: () => this.pushToConvertionPage(context),

            splashColor: this.color,

            highlightColor: this.color,

            child: Row(

              children: <Widget>[

                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(right: 20),

                    child: Image.asset(
                      this.unitGroup.imagePath,
                      width: 60,
                      height: 60,
                      color: Colors.black,
                    ),
                  ),
                  
                  Text(
                    this.unitGroup.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  )

              ],
            ),
          ),
        ),
        
      )
    );
  }

}
