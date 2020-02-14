import 'package:flutter/widgets.dart';
import 'package:playlist/components/musics-list/musics-list.dart';
import 'package:playlist/models/song.dart';

class MusicsListState extends StatefulWidget {

  final List<Song> musicsList;

  MusicsListState({
    @required this.musicsList
  });

  @override
  State<StatefulWidget> createState() => MusicsList(musicsList: this.musicsList,);

}
