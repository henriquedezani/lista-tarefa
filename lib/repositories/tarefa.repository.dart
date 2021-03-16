import 'package:tarefas_app/models/tarefa.model.dart';

class TarefaRepository {
  static List<Tarefa> tarefas = List<Tarefa>();

  TarefaRepository() {
    if (tarefas.isEmpty) {
      tarefas.add(Tarefa(id: "1", texto: "Lavar o carro", finalizada: false));
      tarefas.add(Tarefa(id: "2", texto: "Estudar", finalizada: true));
      tarefas.add(Tarefa(id: "3", texto: "Assistir filme", finalizada: false));
    }
  }

  void create(Tarefa tarefa) {
    tarefas.add(tarefa);
  }

  List<Tarefa> read() {
    return tarefas;
  }
}
