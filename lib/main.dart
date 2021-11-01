import 'package:flutter/material.dart';
import 'package:bytebank/screens/transferencias/lista.dart';

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
          buttonColor: Colors.teal[700],
          textTheme: ButtonTextTheme.primary,
      ),
      ),
      home: ListaTransferencias(),
    );
  }
}






