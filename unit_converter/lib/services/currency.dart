import 'package:dio/dio.dart';

class Currency {

  Dio dio = new Dio();

  Future<Response> _get(String url) {
    try {

      final response = dio.get(url);
      return response;

    } catch (e) {
      print('$e');
      return null;
    }
  }

  Future<Response> getCurrencies() async {
    return await this._get('https://flutter.udacity.com/currency');
  }

  Future<Response> getConversion(String firstUnit, String secondUnit, double value) async {
    return await this._get('https://flutter.udacity.com/currency/convert?from=$firstUnit&to=$secondUnit&amount=$value');
  }

}
