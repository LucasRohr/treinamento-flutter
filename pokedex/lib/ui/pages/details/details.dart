import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon-details.model.dart';
import 'package:pokedex/services/pokemon.service.dart';
import 'package:pokedex/ui/pages/details/details.state.dart';

class Details extends State<DetailsState> {

  final int pokemonId;
  PokemonDetails pokemonDetails;

  Details({
    @required this.pokemonId
  });

  void getPokemonById() async {
    final pokemonDetailsResponse = await PokemonService().getPokemonDetailsById(this.pokemonId);

    setState(() {
      this.pokemonDetails = PokemonDetails.fromJson(pokemonDetailsResponse.data);
    });
  }

  @override
  void initState() { 
    super.initState();
    this.getPokemonById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.renderDetailsPage(),
    );
  }

  void navigateToPokemonList() {
    Navigator.pop(context);
  }

  String getPokemonCapitalizedName(String name) {
    return '${name[0].toUpperCase()}${name.substring(1)}';
  }

  Widget getPokemonTypes(List types) {
    if(types.length == 1) {
      return (
        Container(
          width: 110,
          height: 45,

          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),

          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Image.asset(
                  'assets/images/types/${types[0]}.png'
                ),

                Text(
                  types[0].toString().toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                  ),
                )
              ],
            )
        )
      );
    }

    return (
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Container(
            width: 110,
            height: 45,

            margin: EdgeInsets.only(right: 15),

            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Image.asset(
                  'assets/images/types/${types[0]}.png'
                ),

                Text(
                  types[0].toString().toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                  ),
                )
              ],
            )
          ),

          Container(
            width: 110,
            height: 45,

            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Image.asset(
                  'assets/images/types/${types[1]}.png'
                ),

                Text(
                  types[1].toString().toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                  ),
                )
              ],
            )
          )
        ],
      )
    );
  }

  Widget renderDetailsPage() {
    if(this.pokemonDetails == null) {
      return Container();
    }

    return (
      Container(
        color: Colors.blue,
        alignment: Alignment.topCenter,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 50),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: IconButton(
                      onPressed: this.navigateToPokemonList,

                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 60),

                    child: Image.network(
                      this.pokemonDetails.imageUrl,
                      width: 160,
                      height: 160,
                    )
                  )
                  
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,

                padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 25),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75),
                    topRight: Radius.circular(75),
                  )
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    
                    Text(
                      this.getPokemonCapitalizedName(this.pokemonDetails.name),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(top: 30),

                      child: this.getPokemonTypes(this.pokemonDetails.types),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 30),

                      child: Text(
                        this.pokemonDetails.description,
                        textAlign: TextAlign.center,
                        
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
                        ),
                      )
                    ),

                    

                  ],
                ),
              )
            )
          ],
        )
      )
    );
  }

}
