import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      {'icon': Icons.bed, 'title': 'Arrumar a cama'},
      {'icon': Icons.menu_book, 'title': 'Ler 25 páginas de um livro'},
      {'icon': Icons.directions_run, 'title': 'Corrida Matinal'},
      {'icon': Icons.menu, 'title': 'Estudar por 1 hora'},
    ];

    return Column(
      children: tasks.map((task) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFDCE7FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Icon(task['icon'] as IconData, color: Colors.black54),
            title: Text(
              task['title'] as String,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
        );
      }).toList(),
    );
  }
}
