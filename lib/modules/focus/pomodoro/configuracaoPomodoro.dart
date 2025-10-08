import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // ⬅️ IMPORT NECESSÁRIO PARA O ESTILO DA FONTE
import 'package:teste1/modules/focus/pomodoro/timerPomodoro.dart';


class ConfiguracaoPomodoro extends StatelessWidget {
  const ConfiguracaoPomodoro({super.key});

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
                Text(
                  'Duração do Foco (Minutos):', 
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                ),
                
                const SizedBox(height: 8),

                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "25",
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Timerpomodoro(),
                        ),
                      );
                    },
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