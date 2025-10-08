import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async'; 

enum PomodoroState {
  stopped,
  running,
  paused,
}

enum SessionType {
  study,
  breakSession, 
}

class Timerpomodoro extends StatefulWidget {
  final int studyMinutes;
  final int breakMinutes;

  const Timerpomodoro({
    super.key, 
    this.studyMinutes = 25, 
    this.breakMinutes = 5,
  });

  @override
  State<Timerpomodoro> createState() => _TimerpomodoroState();
}

class _TimerpomodoroState extends State<Timerpomodoro> {
  late PomodoroState _state;
  late SessionType _sessionType;
  late int _currentTimeInSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _state = PomodoroState.stopped;
    _sessionType = SessionType.study;
    _currentTimeInSeconds = widget.studyMinutes * 60;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (_state == PomodoroState.running) return;

    _state = PomodoroState.running;
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTimeInSeconds == 0) {
        _handleTimerFinish();
      } else {
        setState(() {
          _currentTimeInSeconds--;
        });
      }
    });
    setState(() {}); 
  }

  void _pauseTimer() {
    if (_state == PomodoroState.running) {
      _timer?.cancel();
      setState(() {
        _state = PomodoroState.paused;
      });
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _state = PomodoroState.stopped;
      _sessionType = SessionType.study;
      _currentTimeInSeconds = widget.studyMinutes * 60;
    });
  }

  void _handleTimerFinish() {
    _timer?.cancel();

    setState(() {
      _state = PomodoroState.stopped; 

      if (_sessionType == SessionType.study) {
        _sessionType = SessionType.breakSession;
        _currentTimeInSeconds = widget.breakMinutes * 60;
      } else {
        _sessionType = SessionType.study;
        _currentTimeInSeconds = widget.studyMinutes * 60;
      }
      
      _startTimer(); 
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }
  
  Widget _buildControlButton({required IconData icon, required VoidCallback onPressed, required String label}) {
    return SizedBox(
      width: 120, 
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int maxTime = _sessionType == SessionType.study 
        ? widget.studyMinutes * 60 
        : widget.breakMinutes * 60;
        
    final double progressValue = maxTime > 0 ? 1.0 - (_currentTimeInSeconds / maxTime) : 0.0;

    final String sessionLabel = _sessionType == SessionType.study 
        ? 'TEMPO DE FOCO' 
        : 'TEMPO DE DESCANSO';

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF007BFF), Color(0xFF6A0DAD)], 
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, 
        
        appBar: AppBar(
          title: Text(
            'Timer Pomodoro', 
            style: GoogleFonts.poppins(color: Colors.white) 
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white), 
        ),
        
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sessionLabel,
                    style: GoogleFonts.poppins(fontSize: 24, color: Colors.white70, fontWeight: FontWeight.w600),
                  ),
                  
                  const SizedBox(height: 50),
                  
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: CircularProgressIndicator(
                          value: progressValue, 
                          backgroundColor: Colors.white.withOpacity(0.2),
                          color: _sessionType == SessionType.study 
                              ? Colors.lightGreenAccent 
                              : Colors.pinkAccent, 
                          strokeWidth: 15,
                        ),
                      ),
                      Text(
                        _formatTime(_currentTimeInSeconds), 
                        style: GoogleFonts.poppins(fontSize: 64, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 80),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildControlButton(
                        icon: _state == PomodoroState.running ? Icons.pause : Icons.play_arrow,
                        onPressed: _state == PomodoroState.running ? _pauseTimer : _startTimer,
                        label: _state == PomodoroState.running ? 'Pausa' : 'Iniciar',
                      ),

                      _buildControlButton(
                        icon: Icons.stop,
                        onPressed: _stopTimer,
                        label: 'Parar',
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 40),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
