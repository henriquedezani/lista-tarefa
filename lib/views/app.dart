import 'package:flutter/material.dart';
import 'package:tarefas_app/views/lista.page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // método responsável por desenhar a tela do aplicativo.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaPage(),
    );
  }
}
