import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/ui/pages/details/details.state.dart';
import 'package:splashscreen/splashscreen.dart';

class DetailsSplash extends StatelessWidget {

  DetailsSplash({
    @required this.pokemon
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: <Widget>[

          SplashScreen(
            seconds: 3,
            backgroundColor: Colors.amber,
            navigateAfterSeconds: DetailsState(pokemonId: pokemon.id,),
            loaderColor: Colors.transparent,
          ),

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  pokemon.imageUrl,
                  scale: 1.8
                ),
                fit: BoxFit.none,
              ),
            ),
          ),

        ],
      );
  }

}
