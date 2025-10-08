import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'timerPomodoro.dart'; 

class ConfiguracaoPomodoro extends StatefulWidget {
  const ConfiguracaoPomodoro({super.key});

  @override
  State<ConfiguracaoPomodoro> createState() => _ConfiguracaoPomodoroState();
}

class _ConfiguracaoPomodoroState extends State<ConfiguracaoPomodoro> {
  final TextEditingController _focoController = TextEditingController(text: '25'); // Padrão: 25 minutos
  final TextEditingController _descansoController = TextEditingController(text: '5');  // Padrão: 5 minutos

  @override
  void dispose() {
    _focoController.dispose();
    _descansoController.dispose();
    super.dispose();
  }

  void _iniciarPomodoro() {
    final int focoMinutos = int.tryParse(_focoController.text) ?? 25;
    final int descansoMinutos = int.tryParse(_descansoController.text) ?? 5;

    final int minutosEstudo = focoMinutos < 1 ? 25 : focoMinutos;
    final int minutosDescanso = descansoMinutos < 1 ? 5 : descansoMinutos;


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Timerpomodoro(
          studyMinutes: minutosEstudo,
          breakMinutes: minutosDescanso,
        ),
      ),
    );
  }

  Widget _buildTimeField({
    required String label, 
    required TextEditingController controller, 
    required String hint
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(color: Colors.white70),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
            'Configuração Pomodoro', 
            style: GoogleFonts.poppins(color: Colors.white) 
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white), 
        ),
        
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTimeField(
                  label: 'Duração do Foco (Minutos):',
                  controller: _focoController,
                  hint: '25',
                ),
                
                const SizedBox(height: 30),
                
                _buildTimeField(
                  label: 'Duração do Descanso (Minutos):',
                  controller: _descansoController,
                  hint: '5',
                ),
                
                const SizedBox(height: 50), 
                
                SizedBox(
                  width: double.infinity,
                  height: 50, 
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), 
                      ),
                      elevation: 0, 
                    ),
                    onPressed: _iniciarPomodoro, 
                    icon: const Icon(Icons.timer, color: Colors.white),
                    label: Text(
                      'Iniciar Pomodoro',
                      style: GoogleFonts.poppins(
                        fontSize: 18, 
                        color: Colors.white, 
                      ),
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
