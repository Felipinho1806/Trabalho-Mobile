import 'package:flutter/material.dart';
import 'package:teste1/modules/task/task_model.dart';


class TaskList extends StatelessWidget {
  final List<TaskModel> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Text(
        "Nenhuma tarefa adicionada ainda.",
        style: TextStyle(
          color: Colors.black54,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return Column(
      children: tasks.map((task) {
        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle_outline),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  task.titulo,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
