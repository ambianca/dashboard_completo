// main.dart
// Ponto de entrada do app: só inicia o MaterialApp e abre a HomePage.

import 'package:flutter/material.dart';
import 'home.dart'; // importa a tela criada no arquivo home.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // remove a faixa "debug"
      home: HomePage(), // primeira tela do app
    );
  }
}