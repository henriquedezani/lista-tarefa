import 'package:flutter/material.dart';
import 'package:tarefas_app/models/tarefa.model.dart';
import 'package:tarefas_app/repositories/tarefa.repository.dart';

class EditaPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _tarefa = Tarefa();
  final _repository = TarefaRepository();

  onSave(BuildContext context, Tarefa tarefa) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save(); // ~ submit do form do HTML
      _repository.update(_tarefa, tarefa);
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    Tarefa tarefa = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edita Tarefa"),
        centerTitle: false,
        actions: [
          FlatButton(
            child: Text("SALVAR",
                style: TextStyle(
                  color: Colors.white,
                )),
            onPressed: () => onSave(context, tarefa),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: TextFormField(
            initialValue: tarefa.texto,
            decoration: InputDecoration(
              labelText: "Descrição",
              border: OutlineInputBorder(),
            ),
            onSaved: (value) => _tarefa.texto = value,
            validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
          ),
        ),
      ),
    );
  }
}
