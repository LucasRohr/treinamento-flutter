import 'package:flutter/widgets.dart';
import 'package:playlist/components/genres-list/genre-item/genre-item.state.dart';

class GenresList extends StatelessWidget {

  final List genresList;
  final Function onSelect;
  final String selectedGenre;

  GenresList({
    @required this.genresList,
    @required this.onSelect,
    @required this.selectedGenre
  });

  Widget renderGenderItem(context, index) {
    return (
      GenreItemState(
        gender: this.genresList[index],
        onSelect: this.onSelect,
        selectedGenre: this.selectedGenre
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: renderGenderItem,
      itemCount: this.genresList.length,
      scrollDirection: Axis.horizontal,
    );
  }

}
