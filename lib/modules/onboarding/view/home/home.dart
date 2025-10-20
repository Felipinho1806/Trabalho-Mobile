import 'package:flutter/material.dart';
import 'widgets/header.dart';
import 'widgets/categorias.dart';
import 'widgets/progresso.dart';
import 'widgets/calendario_dias.dart';
import 'widgets/tarefas.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F0FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderSection(),
              SizedBox(height: 20),
              CategoryButtons(),
              SizedBox(height: 20),
              ProgressCard(),
              SizedBox(height: 16),
              WeekSelector(),
              SizedBox(height: 8),
              Text(
                "Hoje (4)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              TaskList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF5E8BFF),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
