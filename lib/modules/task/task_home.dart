import 'package:flutter/material.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({super.key});

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // Lista das tarefas
  final List<Map<String, dynamic>> tasks = [];

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

  void _addTask(String title, String status) {
    setState(() {
      tasks.add({
        "title": title,
        "status": status,
      });
    });
  }

  // Card de tarefa (AGORA COM MUDANÇA DE STATUS)
  Widget _buildTaskCard(
    String title,
    String status,
    Color color,
    IconData icon,
    Function(String) statusCallback,
  ) {
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
            trailing: PopupMenuButton<String>(
              onSelected: (newStatus) => statusCallback(newStatus),
              itemBuilder: (context) => const [
                PopupMenuItem(value: "Pendente", child: Text("Mover para Pendentes")),
                PopupMenuItem(value: "Em andamento", child: Text("Mover para Em Andamento")),
                PopupMenuItem(value: "Concluída", child: Text("Mover para Concluída")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Modal para criar tarefa
  void _showAddTaskDialog() {
    final TextEditingController titleController = TextEditingController();
    String selectedStatus = "Pendente";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Criar objetivo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Título do objetivo"),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                decoration: const InputDecoration(labelText: "Status"),
                items: const [
                  DropdownMenuItem(value: "Pendente", child: Text("Pendente")),
                  DropdownMenuItem(value: "Em andamento", child: Text("Em andamento")),
                  DropdownMenuItem(value: "Concluída", child: Text("Concluída")),
                ],
                onChanged: (value) => selectedStatus = value!,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  _addTask(titleController.text, selectedStatus);
                  Navigator.pop(context);
                }
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filtra categorias
    final pendentes = tasks.where((t) => t["status"] == "Pendente").toList();
    final andamento = tasks.where((t) => t["status"] == "Em andamento").toList();
    final concluidas = tasks.where((t) => t["status"] == "Concluída").toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      appBar: AppBar(
        title: const Text("Meus Objetivos"),
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
              // ------------------------
              // PENDENTES
              // ------------------------
              const Text("Pendentes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              ...pendentes.map((t) => _buildTaskCard(
                    t["title"],
                    t["status"],
                    Colors.orange,
                    Icons.pending_actions,
                    (newStatus) {
                      setState(() {
                        t["status"] = newStatus;
                      });
                    },
                  )),

              const SizedBox(height: 25),

              // ------------------------
              // EM ANDAMENTO
              // ------------------------
              const Text("Em andamento", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              ...andamento.map((t) => _buildTaskCard(
                    t["title"],
                    t["status"],
                    Colors.blue,
                    Icons.autorenew,
                    (newStatus) {
                      setState(() {
                        t["status"] = newStatus;
                      });
                    },
                  )),

              const SizedBox(height: 25),

              // ------------------------
              // CONCLUÍDAS
              // ------------------------
              const Text("Concluídas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              ...concluidas.map((t) => _buildTaskCard(
                    t["title"],
                    t["status"],
                    Colors.green,
                    Icons.check_circle,
                    (newStatus) {
                      setState(() {
                        t["status"] = newStatus;
                      });
                    },
                  )),
            ],
          ),
        ),
      ),

      floatingActionButton: FadeTransition(
        opacity: _animation,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF5E8BFF),
          onPressed: _showAddTaskDialog,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
