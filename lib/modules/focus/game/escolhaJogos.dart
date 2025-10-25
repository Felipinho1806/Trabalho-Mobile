import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:teste1/modules/focus/game/damas.dart';
import 'package:teste1/modules/focus/game/jogo_memoria.dart';

class FocusGamesScreen extends StatelessWidget {
  const FocusGamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Focus Games"),
        backgroundColor: const Color(0xFF4A8CFF),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB9D6FF), Color(0xFF4A8CFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              child: const Text(
                "Escolha seu jogo",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildGameOption(
                    context,
                    icon: Icons.memory,
                    title: "Jogo da Memória",
                    delay: 0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MemoryGameScreen(),
                        ),
                      );
                    },
                  ),
                  _buildGameOption(
                    context,
                    icon: Icons.sports_esports, // ícone genérico para damas
                    title: "Damas 2 Players",
                    delay: 100,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckersGameScreen(),
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
    );
  }

  Widget _buildGameOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int delay,
    required VoidCallback onTap,
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
