import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playlist/components/musics-list/music-item/music-item.state.dart';

class MusicItem extends State<MusicItemState> {

  final String title;
  final String artist;
  bool isPlaying = false;
  bool isSelected = false;

  MusicItem({
    @required this.title,
    @required this.artist
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          this.isSelected = true;
          this.isPlaying = !this.isPlaying;
        });
      },

      splashColor: Colors.pink[300],
      highlightColor: Colors.pink[200],

      child: Container(

        padding: EdgeInsets.only(top: 15, bottom: 20, left: 15, right: 15),

        margin: EdgeInsets.only(left: 15, right: 15),
        
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color.fromRGBO(191, 207, 220, 1))
          )
        ),

        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[

                Text(
                  this.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: this.isSelected ? Colors.pink : Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15),

                  child: Text(
                    this.artist,
                    style: TextStyle(
                      fontSize: 16,
                      color: this.isSelected ? Colors.pink : Colors.black
                    ),
                  )
                )

              ],
            ),

            isSelected ?
              Icon(
                this.isPlaying ? Icons.pause_circle_outline : Icons.play_arrow,
                color: Colors.pink,
                size: 35,
              )
            :
              Container()

          ],
        ),
      )
    );
  }

}
