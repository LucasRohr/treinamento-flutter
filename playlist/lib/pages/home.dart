import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playlist/components/genres-list/genres-list.dart';
import 'package:playlist/components/musics-list/musics-list.dart';
import 'package:playlist/components/musics-list/musics-list.state.dart';
import 'package:playlist/models/song.dart';

class Home extends State {

  String selectedGender;

  static const _genres = <String>[
    'Rock',
    'Sertanejo',
    'Pop',
    'Pagode'
  ];

  var _songs = <Song>[
    Song('Dance Monkey', 'Tones and I'),
    Song('Tudo OK', 'Thiaguinho MT'),
    Song('Não Pare', 'Midian Lima'),
    Song('Anyone', 'Someone You Loved'),
    Song('Girassol', 'Priscilla Alcantara'),
    Song('Você não ama ninguém 2', 'Pineapple'),
    Song('bad guy', 'Billie Eilish'),
    Song('Liberdade Provisória', 'Henrique e Juliano'),
    Song('Someone You Loved', 'Lewis Capaldi'),
    Song('Tua presença', 'Paulo Neto'),
    Song('Ameno', 'Era'),
  ];

  var _favSongs = <Song>[
  Song('Dance Monkey', 'Tones and I'),
  Song('Tudo OK', 'Thiaguinho MT'),
  Song('Não Pare', 'Midian Lima'),
  Song('Anyone', 'Someone You Loved'),
  Song('Girassol', 'Priscilla Alcantara'),
  Song('Você não ama ninguém 2', 'Pineapple'),
  Song('bad guy', 'Billie Eilish'),
  Song('Liberdade Provisória', 'Henrique e Juliano'),
  Song('Someone You Loved', 'Lewis Capaldi'),
  Song('Tua presença', 'Paulo Neto'),
  Song('Ameno', 'Era'),
];

var _rockSongs = <Song>[
  Song('Welcome to the Jungle', 'Guns n\' Roses'),
  Song('Nothing else matters', 'Metallica'),
  Song('Dias atrás', 'CPM 22'),
  Song('Me lambe', 'Raimundos'),
  Song('Rock n Roll', 'Led Zeppelin'),
  Song('Thunderstruck', 'AC/DC'),
  Song('We will rock you', 'Queen'),
  Song('Creep', 'Radiohead'),
  Song('Hey Jude', 'The Beatles'),
  Song('Paint it, Black', 'Rolling Stones'),
];

var _sertanejoSongs = <Song>[
  Song('Liberdade Provisória', 'Henrique & Juliano'),
  Song('Bebi Minha Bicicleta', 'Zé Neto & Cristiano'),
  Song('Fake News', 'Gustavo Miotto'),
  Song('Evidências', 'Chitãozinho & Xororó'),
  Song('É o amor', 'Zezé de Camargo & Luciano'),
  Song('Degrau na Escada', 'Chico Rey & Paraná'),
  Song('Mentira', 'Felipe Araújo'),
  Song('Mil Anos', 'Jorge e Matheus'),
  Song('Barzinho Aleatório', 'Zé Neto & Cristiano'),
  Song('quando a bad bater', 'Luan Santana'),
];

var _popSongs = <Song>[
  Song('Bad Liar', 'Imagine Dragons'),
  Song('Dance Monkey', 'Tones and I'),
  Song('Fake Yummy', 'Justin Bieber'),
  Song('Beach House', 'Chainsmokers'),
  Song('Skater Boy', 'Avril Lavigne'),
  Song('Toxic', 'Britney Spears'),
  Song('I want it that way', 'Backstreet Boys'),
  Song('Shallow', 'Lady Gaga'),
  Song('My Hips Dont Lie', 'Shakira'),
  Song('Empire State of Mind', 'Alicia Keys'),
];

var _pagodeSongs = <Song>[
  Song('Inaraí', 'Kantinguelê'),
  Song('Cilada', 'Molejo'),
  Song('Tanajura', 'Negritude Júnior'),
  Song('Maravilha Te Amar', 'Os Travessos'),
  Song('Maça Do Amor', 'Soweto'),
  Song('Se Melhorar Estraga', 'Karametade'),
  Song('Me Apaixonei Pela Pessoa Errada', 'Exaltasamba'),
  Song('Depois do Prazer', 'Só Pra Contrariar'),
  Song('Cigana', 'Raça Negra'),
  Song('Eterno Amor', 'Sampa Crew'),
];


  void filterList() {
    switch (this.selectedGender) {
      case 'Rock':
        setState(() {
          print(this.selectedGender);
          this._songs = this._rockSongs;
        });
        break;

      default:
        break;
    }
  }

  void setSelectedGenre(genre) {
    setState(() {
      this.selectedGender = genre;
      print(genre);
    });
    this.filterList();
  }

  BottomNavigationBarItem renderBottomNavItem(IconData icon, String title) {
    return (
      BottomNavigationBarItem(
        backgroundColor: Colors.pink,

        activeIcon: Icon(
          icon,
          color: Colors.white,
        ),

        icon: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: renderHomeBody(),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,

        items: <BottomNavigationBarItem>[

          this.renderBottomNavItem(Icons.call_made, 'Browse'),

          this.renderBottomNavItem(Icons.library_music, 'All tracks'),

          this.renderBottomNavItem(Icons.playlist_play, 'Playlists'),

          this.renderBottomNavItem(Icons.search, 'Search'),

        ],
      ),
    );
  }

  Widget renderHeader() {
    return (
      Container(
        padding: EdgeInsets.only(bottom: 40, right: 20, left: 20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Text(
              'Playlists',
              style: TextStyle(
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.bold
              ),
            ),

            Icon(
              Icons.person,
              size: 45,
              color: Colors.pink,
            )
          ],
        )
      )
    );
  }

  Widget renderHomeBody() {
    return (
      Container(
        padding: EdgeInsets.only(top: 50),

        width: double.infinity,

        child: Column(
          children: <Widget>[

            this.renderHeader(),

            Container(
              height: 100,

              margin: EdgeInsets.only(bottom: 40),

              child: GenresList(
                genresList: Home._genres,
                selectedGenre: this.selectedGender,
                onSelect: this.setSelectedGenre
              )
            ),

            Expanded(
              child: MusicsListState(
                musicsList: this._songs,
              ),
            )

          ],
        ),
      )
    );
  }

}
