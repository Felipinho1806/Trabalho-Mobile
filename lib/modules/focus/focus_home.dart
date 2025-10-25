import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:teste1/modules/focus/game/escolhaJogos.dart';

// import correto para a tela do Pomodoro
import '/modules/focus/pomodoro/configuracaoPomodoro.dart';

class FocusHome extends StatelessWidget {
  const FocusHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB9D6FF), Color(0xFF4A8CFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho
            Row(
              children: [
                FadeInDown(
                  child: Icon(
                    Icons.center_focus_strong,
                    size: 42,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(width: 10),
                FadeInDown(
                  delay: const Duration(milliseconds: 200),
                  child: const Text(
                    "Focus",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            FadeInDown(
              delay: const Duration(milliseconds: 300),
              child: const Text(
                "Reduza distrações, organize seu tempo e aumente a produtividade.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Opções Focus
            Expanded(
              child: ListView(
                children: [
                  _buildOption(
                    icon: Icons.timer,
                    title: "Pomodoro Timer",
                    delay: 0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfiguracaoPomodoro(),
                        ),
                      );
                    },
                  ),
                  _buildOption(
                    icon: Icons.self_improvement,
                    title: "Meditação",
                    delay: 100,
                  ),
                  _buildOption(
                    icon: Icons.mood,
                    title: "Descompressão",
                    delay: 200,
                  ),
                  _buildOption(
                    icon: Icons.extension,
                    title: "Focus games",
                    delay: 300,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FocusGamesScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Botão para voltar à Home
      floatingActionButton: FadeInUp(
        delay: const Duration(milliseconds: 300),
        child: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          elevation: 6,
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF4A8CFF),
            size: 28,
          ),
        ),
      ),
    );
  }

  // Função auxiliar
  Widget _buildOption({
    required IconData icon,
    required String title,
    required int delay,
    VoidCallback? onTap,
  }) {
    return FadeInLeft(
      delay: Duration(milliseconds: 300 + delay),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.1),
              offset: const Offset(2, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: const Color(0xFF4A8CFF), size: 28),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
