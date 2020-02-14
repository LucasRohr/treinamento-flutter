import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playlist/components/genres-list/genre-item/genre-item.state.dart';

class GenreItem extends State<GenreItemState> {

  final String gender;
  final Function onSelect;
  bool isSelected = false;
  final String selectedGenre;

  GenreItem({
    @required this.gender,
    @required this.onSelect,
    @required this.selectedGenre,
  });

  void checkSelected() {
    print(this.selectedGenre);
    if(this.selectedGenre != null && this.selectedGenre != this.gender) {
      setState(() {
        this.isSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,

      onPressed: () {
        setState(() {
          if(!this.isSelected) {
            this.onSelect(this.gender);
          }
          this.isSelected = !this.isSelected;
          this.checkSelected();
        });
      },

      child: Container(
        width: 95,
        height: 95,
        alignment: Alignment.center,

        decoration: new BoxDecoration(
          color: this.isSelected ? Colors.pink : Colors.pink[100],
          shape: BoxShape.circle,
        ),

        child: Text(
          this.gender,
          style: TextStyle(
            fontSize: 15,
            color: this.isSelected ? Colors.white : Colors.pink
          ),
        ),
      )
    );
  }

}
