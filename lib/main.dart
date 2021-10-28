import 'package:flutter/material.dart';

const primaryColor = Color(0xFF1B5E20);
const scaffoldColor = Color(0xFFE8F5E9);

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: scaffoldColor,
        body: ListaTransferencias(),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Transferências'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {},
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: primaryColor,
          child: Container(height: 50)
        ),
      ),
    ));

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 2000)),
          ItemTransferencia(Transferencia(300.0, 4000)),
          ItemTransferencia(Transferencia(5500.80, 4000)),
        ]
    );
  }
}
