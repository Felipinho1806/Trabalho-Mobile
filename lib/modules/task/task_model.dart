class TaskModel {
  final String titulo;
  final String? categoria;
  final String? descricao;
  final DateTime? data;
  bool concluida;

  TaskModel({
    required this.titulo,
    this.categoria,
    this.descricao,
    this.data,
    this.concluida = false,
  });
}
