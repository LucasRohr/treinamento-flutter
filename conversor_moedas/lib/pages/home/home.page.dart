import 'package:conversor_moedas/components/input/input.component.dart';
import 'package:conversor_moedas/services/base-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home.state.dart';

const coinsUrl = 'https://api.hgbrasil.com/finance?key=e39d6309 ';

class Home extends State<HomeState> {

  final TextEditingController realController = new TextEditingController();
  final TextEditingController dolarController = new TextEditingController();
  final TextEditingController euroController = new TextEditingController();

  double dolar;
  double euro;

  void clearFields() {
    this.realController.text = '';
    this.dolarController.text = '';
    this.euroController.text = '';
  }

  void checkEmptyField(String text) {
    if(text.isEmpty) {
      this.clearFields();
    }
  }

  void setRealChange(String text) {
    this.checkEmptyField(text);
    double real = double.parse(text);
    this.dolarController.text = ( real / this.dolar ).toStringAsFixed(2);
    this.euroController.text = ( real / this.euro ).toStringAsFixed(2);
  }

  void setDolarChange(String text) {
    this.checkEmptyField(text);
    double dolar = double.parse(text);
    this.realController.text = ( dolar * this.dolar ).toStringAsFixed(2);
    this.euroController.text = ( ( dolar * this.dolar ) / euro ).toStringAsFixed(2);
  }

  void setEuroChange(String text) {
    this.checkEmptyField(text);
    double euro = double.parse(text);
    this.realController.text = ( euro * this.euro ).toStringAsFixed(2);
    this.dolarController.text = ( ( euro * this.euro ) / dolar ).toStringAsFixed(2);
  }

  Widget renderPadding(double padding, Widget widget) {
    return Padding(
      padding: EdgeInsets.all(padding),

      child: widget,
    );
  }

  Widget renderHomeBody() {

    return  SingleChildScrollView(

      padding: EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[

          Icon(
            Icons.monetization_on,
            color: Colors.amber,
            size: 120,
          ),

          Divider(
            height: 50,
          ),

          Input(

            placeholder: 'Valor em Reais',

            onChanged: this.setRealChange,

            prefixText: 'R\$ ',

            type: TextInputType.numberWithOptions(decimal: true),

            controller: this.realController,

          ),

          Divider(
            height: 40,
          ),

          Input(

            placeholder: 'Valor em Dólares',

            onChanged: this.setDolarChange,

            prefixText: '\$ ',

            type: TextInputType.numberWithOptions(decimal: true),

            controller: this.dolarController,

          ),

          Divider(
            height: 40,
          ),

          Input(

            placeholder: 'Valor em Euros',

            onChanged: this.setEuroChange,

            prefixText: '€ ',

            type: TextInputType.numberWithOptions(decimal: true),

            controller: this.euroController,

          )
        ],

      ),

    );

  }

  Widget checkRenderPage(snapshot) {
    if(snapshot.hasError) {
      return Center(
        child: Text(
          'Erro',
          style: TextStyle(
            color: Colors.red[400],
            fontSize: 40
          ),
        ),
      );
    } else {
      this.dolar = snapshot.data['results']['currencies']['USD']['buy'];
      this.euro = snapshot.data['results']['currencies']['EUR']['buy'];
      return this.renderHomeBody();
    }

  }

  Widget futureBuilder(context, snapshot) {

    switch (snapshot.connectionState) {

      case ConnectionState.none:
      case ConnectionState.waiting:
        return Center(
          child: Text(
            'Carregando...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23
            ),
          ),
        );

      case ConnectionState.done:
        return this.checkRenderPage(snapshot);
      
      default:
        return Text('');
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text(
          'Conversor de Moedas',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber
      ),

      body: FutureBuilder<Map>(
        future: defaultGet(coinsUrl),

        builder: (context, snaphot) {
          return this.futureBuilder(context, snaphot);
        },
      ),

    );
  }

}
