import 'package:flutter/material.dart';
import '/modules/focus/focus_home.dart';
import '/modules/habits/habits_home.dart';
import '/modules/progress/progress_home.dart'; 
import '/modules/task/task_home.dart';


class CategoryButtons extends StatelessWidget {
  const CategoryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {'icon': Icons.task_alt, 'label': 'Tarefas'},
      {'icon': Icons.center_focus_strong, 'label': 'Focus'},
      {'icon': Icons.fitness_center, 'label': 'Hábitos'},
      {'icon': Icons.bar_chart, 'label': 'Progresso'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 12) / 2;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: buttons.map((b) {
            return SizedBox(
              width: itemWidth,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5E8BFF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  alignment: Alignment.centerLeft,
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: () {
                  if (b['label'] == 'Focus') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FocusHome()),
                    );
                  } else if (b['label'] == 'Hábitos') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HabitsHome()),
                    );
                  } else if (b['label'] == 'Progresso') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProgressHome()),
                    );
                  } else if (b['label'] == 'Tarefas') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TasksHome()),
                    );
                  }

                },
                icon: Icon(b['icon'] as IconData),
                label: Text(
                  b['label'] as String,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
