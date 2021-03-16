import 'package:flutter/material.dart';
import 'package:tarefas_app/models/tarefa.model.dart';
import 'package:tarefas_app/repositories/tarefa.repository.dart';
import 'package:tarefas_app/views/nova.page.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final repository = TarefaRepository();

  List<Tarefa> tarefas;

  @override
  initState() {
    super.initState();
    this.tarefas = repository.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (_, indice) {
          var tarefa = tarefas[indice];
          return CheckboxListTile(
            title: Text(
              tarefa.texto,
              style: TextStyle(
                decoration: tarefa.finalizada
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            value: tarefa.finalizada,
            onChanged: (value) {
              setState(() => tarefa.finalizada = value);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NovaPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
