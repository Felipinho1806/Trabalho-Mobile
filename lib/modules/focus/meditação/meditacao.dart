import 'dart:async';
import 'package:flutter/material.dart';

enum BreathPhase { inspire, expire }

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen>
    with SingleTickerProviderStateMixin {
  bool isRunning = false;
  bool hasStarted = false;
  int seconds = 0;
  Timer? timer;

  late AnimationController _controller;
  late Animation<double> _animation;

  String displayText = "Começar";
  BreathPhase currentPhase = BreathPhase.inspire;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.addStatusListener((status) {
      if (!isRunning) return;

      if (status == AnimationStatus.completed) {
        currentPhase = BreathPhase.expire;
        setState(() => displayText = "Expire");
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        currentPhase = BreathPhase.inspire;
        setState(() => displayText = "Inspire");
        _controller.forward();
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        seconds++;
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void toggleMeditation() {
    setState(() {
      if (!hasStarted) {
        hasStarted = true;
        isRunning = true;
        currentPhase = BreathPhase.inspire;
        displayText = "Inspire";
        _controller.forward(from: 0);
        startTimer();
      } else if (isRunning) {
        isRunning = false;
        displayText = "Pausado";
        _controller.stop(canceled: false);
        stopTimer();
      } else {
        isRunning = true;
        displayText =
            currentPhase == BreathPhase.inspire ? "Inspire" : "Expire";

        if (currentPhase == BreathPhase.inspire) {
          _controller.forward(from: _controller.value);
        } else {
          _controller.reverse(from: _controller.value);
        }

        startTimer();
      }
    });
  }

  String formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final secs = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meditação Guiada"),
        backgroundColor: const Color(0xFF4A8CFF),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB9D6FF), Color(0xFF4A8CFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    displayText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A8CFF),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              formatTime(seconds),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: toggleMeditation,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF4A8CFF),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                !hasStarted
                    ? "Iniciar"
                    : (isRunning ? "Pausar" : "Continuar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
