import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemoryGameScreen extends StatefulWidget {
  const MemoryGameScreen({super.key});

  @override
  _MemoryGameScreenState createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  List<String> _cards = [
    '🍎', '🍎', '🍌', '🍌', '🍓', '🍓', '🍒', '🍒',
    '🍍', '🍍', '🍉', '🍉', '🍇', '🍇', '🍊', '🍊'
  ];

  List<int> _flippedIndexes = [];
  List<int> _matchedIndexes = [];

  @override
  void initState() {
    super.initState();
    _cards.shuffle(Random());
  }

  void _flipCard(int index) {
    if (_flippedIndexes.length == 2 || _flippedIndexes.contains(index)) return;

    setState(() => _flippedIndexes.add(index));

    if (_flippedIndexes.length == 2) {
      final first = _flippedIndexes[0];
      final second = _flippedIndexes[1];

      if (_cards[first] == _cards[second]) {
        setState(() {
          _matchedIndexes.addAll(_flippedIndexes);
          _flippedIndexes.clear();
        });

        if (_matchedIndexes.length == _cards.length) {
          Future.delayed(const Duration(milliseconds: 400), _showGameOver);
        }
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() => _flippedIndexes.clear());
        });
      }
    }
  }

  void _showGameOver() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          "Parabéns!",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        content: Text(
          "Você encontrou todos os pares!",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _cards.shuffle(Random());
                _flippedIndexes.clear();
                _matchedIndexes.clear();
              });
            },
            child: Text(
              "Jogar novamente",
              style: GoogleFonts.poppins(color: const Color(0xFF5E8BFF)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Sair",
              style: GoogleFonts.poppins(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5E8BFF), Color(0xFF6FA7FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Jogo da Memória",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _cards.length,
                    itemBuilder: (context, index) {
                      final isFlipped = _flippedIndexes.contains(index) ||
                          _matchedIndexes.contains(index);

                      return GestureDetector(
                        onTap: () => _flipCard(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: isFlipped
                                ? Colors.white
                                : const Color(0xFF5E8BFF),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26.withOpacity(0.1),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              isFlipped ? _cards[index] : "❓",
                              style: TextStyle(
                                fontSize: isFlipped ? 36 : 28,
                                color: isFlipped
                                    ? Colors.black87
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
