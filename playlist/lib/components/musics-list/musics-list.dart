import 'package:flutter/widgets.dart';
import 'package:playlist/components/musics-list/music-item/music-item.state.dart';
import 'package:playlist/models/song.dart';

class MusicsList extends State {

  final List<Song> musicsList;

  final bool musicIsSelected = false;

  MusicsList({
    @required this.musicsList
  });

  Widget renderGenderItem(context, index) {
    return (
      MusicItemState(
        title: this.musicsList[index].title,
        artist: this.musicsList[index].artist
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: renderGenderItem,
      itemCount: this.musicsList.length,
      scrollDirection: Axis.vertical,
    );
  }

}