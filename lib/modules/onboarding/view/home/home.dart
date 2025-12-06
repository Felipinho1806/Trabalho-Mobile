import 'package:flutter/material.dart';
import 'package:teste1/modules/task/task_add.dart';
import 'package:teste1/modules/task/task_model.dart';
import 'widgets/header.dart';
import 'widgets/categorias.dart';
import 'widgets/progresso.dart';
import 'widgets/calendario_dias.dart';
import 'widgets/tarefas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel> tasks = [];

  void _toggle(TaskModel task) {
    setState(() {
      task.concluida = !task.concluida;
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = tasks.length;
    int feitas = tasks.where((t) => t.concluida).length;

    return Scaffold(
      backgroundColor: const Color(0xFFE8F0FF),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 20),
              const CategoryButtons(),
              const SizedBox(height: 20),

              // CORREÇÃO: ProgressCard com parâmetros
              ProgressCard(total: total, feitas: feitas),

              const SizedBox(height: 16),
              const WeekSelector(),
              const SizedBox(height: 8),

              Text(
                "Hoje ($total)",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              // CORREÇÃO: TaskList com callback
              TaskList(
                tasks: tasks,
                onToggle: _toggle,
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTaskPage()),
          );

          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        backgroundColor: const Color(0xFF5C6BFF),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
