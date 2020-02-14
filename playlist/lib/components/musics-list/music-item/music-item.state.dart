import 'package:flutter/widgets.dart';
import 'package:playlist/components/musics-list/music-item/music-item.dart';

class MusicItemState extends StatefulWidget {

  final String title;
  final String artist;

  MusicItemState({
    @required this.title,
    @required this.artist
  });

  @override
  State<StatefulWidget> createState() => MusicItem(
    title: this.title,
    artist: this.artist
  );

}
