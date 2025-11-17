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

  @override
  Widget build(BuildContext context) {
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
              const ProgressCard(),
              const SizedBox(height: 16),
              const WeekSelector(),
              const SizedBox(height: 8),

              Text("Hoje (${tasks.length})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              TaskList(tasks: tasks), 
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
