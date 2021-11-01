import 'package:flutter/material.dart';

const primaryColor = Color(0xFF1B5E20);
const scaffoldColor = Color(0xFFE8F5E9);

void main() => runApp(BytebankApp());


class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueAccent[700],
        textTheme: ButtonTextTheme.primary,
      ),
      ),
      home: ListaTransferencias(),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on, color: Colors.green,),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Editor extends StatelessWidget {

  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
            fontSize: 16.0
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone, color: Colors.green) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatefulWidget {

  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Criando Transferência'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Número da conta',
              dica: '0000',
            ),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on
            ),
            RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => _criaTransferencia(context)
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: primaryColor,
          child: Container(height: 50)
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta =
    int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor =
    double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      //debugPrint('Criando transferência');
      //debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}


class ListaTransferenciasState extends State<ListaTransferencias> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          final Future future = Navigator.push(
              context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            Future.delayed(Duration(seconds: 1), () {
              //debugPrint('chegou no then do future');
              //debugPrint('$transferenciaRecebida');
              if(transferenciaRecebida != null) {
                setState(() {
                  widget._transferencias.add(transferenciaRecebida);
                });
              }
            });
          });
        },),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: primaryColor,
          child: Container(height: 50)
      ),
    );
  }
}

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor =
  TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}


