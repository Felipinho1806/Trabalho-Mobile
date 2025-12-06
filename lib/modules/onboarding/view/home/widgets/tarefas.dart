import 'package:flutter/material.dart';
import 'package:teste1/modules/task/task_model.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasks;
  final Function(TaskModel) onToggle;

  const TaskList({
    super.key,
    required this.tasks,
    required this.onToggle,
  });

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
        return GestureDetector(
          onTap: () => onToggle(task),
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  task.concluida
                      ? Icons.check_circle
                      : Icons.check_circle_outline,
                  color: task.concluida ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    task.titulo,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      decoration: task.concluida
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
