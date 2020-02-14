import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treinamento_01/pages/second/second.dart';

class Home extends StatelessWidget {

  void _goToSecondPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

        padding: EdgeInsets.only(top: 70, bottom: 25, left: 40, right: 40),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            this.renderHeader(),

            Padding(
              padding: EdgeInsets.only(bottom: 15),

              child: Text(
                'Hey there,',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            Text(
              'Where do you want to go today?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),

            this.renderInputGroup(),

            Padding(
              padding: EdgeInsets.only(top: 70),

              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),

                onPressed: () => this._goToSecondPage(context),

                padding: EdgeInsets.only(top: 25, bottom: 25, left: 30, right: 30),

                color: Color.fromRGBO(70, 70, 70, 0.8),

                child: Text(
                  'LOOK FOR COMMUTE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              ),
            )
            
          ],

        ),

      )
    );
  }

  Widget renderHeader() {

    return(
      Container(
        height: 30,

        margin: EdgeInsets.only(bottom: 70),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            SvgPicture.asset(
              'assets/svg/menu.svg',
              width: 25,
              height: 25,
            ),

            Icon(
              Icons.ac_unit,
              size: 40,
            )
          ],
        ),
      )
      
    );

  }

  Widget renderInputGroup() {
    return (
      Container(

        margin: EdgeInsets.only(top: 90, bottom: 60),

        child: Column(

          children: <Widget>[

            Padding(

              padding: EdgeInsets.only(bottom: 25),

              child: TextFormField(

                decoration: InputDecoration(

                  hintText: 'Country',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(191, 207, 220, 1),
                        width: 1.0
                      ),
                  ),

                  suffixIcon: Icon(
                    Icons.gps_fixed,
                    color: Color.fromRGBO(191, 207, 220, 1),
                  )

                ),

              ),

            ),

            TextFormField(

              decoration: InputDecoration(

                hintText: 'City',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(191, 207, 220, 1),
                      width: 1.0
                    ),
                ),

              ),

            ),
          ],

        )

      )
    );
  }

}