import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class HabitsHome extends StatelessWidget {
  const HabitsHome({super.key});

  @override
  Widget build(BuildContext context) {
    final habits = [
      {'icon': Icons.lightbulb_outline, 'label': 'Aprendizado'},
      {'icon': Icons.self_improvement, 'label': 'Comunicação'},
      {'icon': Icons.menu_book_rounded, 'label': 'Leitura'},
      {'icon': Icons.music_note, 'label': 'Música'},
      {'icon': Icons.fitness_center, 'label': 'Esportes'},
      {'icon': Icons.health_and_safety, 'label': 'Saúde'},
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3ECFF), Color(0xFF5E8BFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho
                Row(
                  children: [
                    const Icon(Icons.refresh, size: 38, color: Color(0xFF003BFF)),
                    const SizedBox(width: 8),
                    Text(
                      "Hábitos",
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Subtítulo
                Text(
                  "Pratique seus melhores hábitos",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0.5, 0.5),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Lista de botões animados
                Expanded(
                  child: ListView.builder(
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      final habit = habits[index];
                      return FadeInUp(
                        delay: Duration(milliseconds: 100 * index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.6),
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 4,
                              shadowColor: Colors.black26,
                              alignment: Alignment.centerLeft, // alinha o conteúdo à esquerda
                            ),
                            onPressed: () {
                              // Futuras rotas dos hábitos
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  habit['icon'] as IconData,
                                  color: const Color(0xFF003BFF),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  habit['label'] as String,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Botão voltar
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 10),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 4,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
