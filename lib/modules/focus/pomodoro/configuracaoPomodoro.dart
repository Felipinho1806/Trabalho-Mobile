import 'package:flutter/material.dart';
import 'package:teste1/modules/focus/pomodoro/timerPomodoro.dart';


class ConfiguracaoPomodoro extends StatelessWidget {
  const ConfiguracaoPomodoro({super.key}); // Adicionei a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração Pomodoro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seus campos de configuração existentes
            const Text(
              'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA:',
              style: TextStyle(fontSize: 18),
            ),
            const TextField(),
            
            // --- Espaço para separar os campos do botão ---
            const SizedBox(height: 50), 
            
            // --- NOVO BOTÃO PARA ABRIR O POMODORO ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navegação para a tela do Pomodoro (FocusView)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Timerpomodoro(),
                    ),
                  );
                },
                icon: const Icon(Icons.timer),
                label: const Text(
                  'Iniciar Pomodoro',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                   // Use o seu tema, mas aqui está um estilo básico
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}