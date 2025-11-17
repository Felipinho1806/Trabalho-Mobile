import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'task_model.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController obsController = TextEditingController();

  String? selectedCategory;
  DateTime selectedDate = DateTime.now();

  final List<String> categories = [
    "Estudo",
    "Esporte",
    "Tarefas Domésticas",
    "Trabalho",
    "Saúde",
    "Outros"
  ];

  Future<void> pickDate() async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Tarefa"),
        centerTitle: true,
        backgroundColor: const Color(0xFF5C6BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nome da tarefa", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Digite o nome...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text("Categoria", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),

            const SizedBox(height: 20),
            const Text("Observação (opcional)", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: obsController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Digite uma observação...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text("Data", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat("dd/MM/yyyy").format(selectedDate)),
                    const Icon(Icons.calendar_today, size: 20),
                  ],
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isEmpty || selectedCategory == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Preencha todos os campos obrigatórios!"),
                      ),
                    );
                    return;
                  }

                  // 🔥 Criar objeto de tarefa
                  final task = TaskModel(
                    titulo: nameController.text,
                    categoria: selectedCategory!,
                    descricao: obsController.text,
                    data: selectedDate,
                  );

                  // 🔥 Retornar tarefa para a HomePage
                  Navigator.pop(context, task);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C6BFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Salvar Tarefa", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
