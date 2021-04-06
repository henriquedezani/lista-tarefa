import 'package:flutter/material.dart';
import 'package:tarefas_app/views/edita.page.dart';
import 'package:tarefas_app/views/lista.page.dart';
import 'package:tarefas_app/views/nova.page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // método responsável por desenhar a tela do aplicativo.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ListaPage(),
      routes: {
        '/': (context) => ListaPage(),
        '/nova': (context) => NovaPage(),
        '/edita': (context) => EditaPage(),
      },
      initialRoute: '/',
    );
  }
}
