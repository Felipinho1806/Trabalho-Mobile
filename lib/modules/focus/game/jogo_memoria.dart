import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

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
        // Par encontrado
        setState(() {
          _matchedIndexes.addAll(_flippedIndexes);
          _flippedIndexes.clear();
        });

        if (_matchedIndexes.length == _cards.length) {
          Future.delayed(const Duration(milliseconds: 400), _showGameOver);
        }
      } else {
        // Não combinou → vira de volta
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
        title: const Text("🎉 Parabéns! Você venceu!"),
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
            child: const Text("Jogar novamente"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Sair"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo da Memória"),
        backgroundColor: const Color(0xFF4A8CFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: _cards.length,
          itemBuilder: (context, index) {
            final isFlipped =
                _flippedIndexes.contains(index) || _matchedIndexes.contains(index);

            return GestureDetector(
              onTap: () => _flipCard(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: isFlipped ? Colors.white : const Color(0xFF4A8CFF),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 5),
                  ],
                ),
                child: Center(
                  child: isFlipped
                      ? Text(
                          _cards[index],
                          style: const TextStyle(fontSize: 40),
                        )
                      : const Text(
                          "❓",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
