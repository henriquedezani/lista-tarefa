import 'package:flutter/material.dart';
import 'package:tarefas_app/models/tarefa.model.dart';
import 'package:tarefas_app/repositories/tarefa.repository.dart';

class NovaPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _tarefa = Tarefa();
  final _repository = TarefaRepository();

  onSave(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save(); // ~ submit do form do HTML
      _repository.create(_tarefa);
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Tarefa"),
        centerTitle: false,
        actions: [
          FlatButton(
            child: Text("SALVAR",
                style: TextStyle(
                  color: Colors.white,
                )),
            onPressed: () => onSave(context),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: TextFormField(
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
