import 'package:flutter/widgets.dart';
import 'package:playlist/components/genres-list/genre-item/gender-item.dart';

class GenreItemState extends StatefulWidget {

  final String gender;
  final Function onSelect;
  final String selectedGenre;

  GenreItemState({
    @required this.gender,
    @required this.onSelect,
    @required this.selectedGenre
  });

  @override
  State<StatefulWidget> createState() => GenreItem(
    gender: this.gender,
    onSelect: this.onSelect
  );

}
