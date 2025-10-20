import 'package:flutter/material.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({super.key});

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildTaskCard(String title, String status, Color color, IconData icon) {
    return FadeTransition(
      opacity: _animation,
      child: ScaleTransition(
        scale: _animation,
        child: Card(
          color: color.withOpacity(0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(status),
            trailing: const Icon(Icons.more_vert, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      appBar: AppBar(
        title: const Text("Minhas Tarefas"),
        backgroundColor: const Color(0xFF5E8BFF),
        centerTitle: true,
        elevation: 2,
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                "Pendentes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildTaskCard("Estudar Flutter", "Aguardando início", Colors.orange, Icons.pending_actions),
              _buildTaskCard("Organizar pastas do projeto", "Não iniciado", Colors.orange, Icons.watch_later_outlined),

              const SizedBox(height: 25),
              const Text(
                "Em andamento",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildTaskCard("Implementar tela de progresso", "50% concluído", Colors.blue, Icons.autorenew),

              const SizedBox(height: 25),
              const Text(
                "Concluídas",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildTaskCard("Tela de foco finalizada", "100% concluído", Colors.green, Icons.check_circle),
              _buildTaskCard("Design da tela de hábitos", "100% concluído", Colors.green, Icons.check_circle),
            ],
          ),
        ),
      ),
      floatingActionButton: FadeTransition(
        opacity: _animation,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF5E8BFF),
          onPressed: () {
            // Futuramente: abrir tela de criação de tarefas
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
