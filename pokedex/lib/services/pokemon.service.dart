import 'package:dio/dio.dart';

class PokemonService {

  Dio dio = new Dio();

  Future<Response> _get(String url) {

    try {
      
      final response = dio.get(url);
      return response;

    } catch (e) {
      return e;
    }

  }

  Future<Response> getPokemonList() async {
    String pokemonListUrl = 'http://10.99.196.185:3000/list';

    return await this._get(pokemonListUrl);
  }

}
