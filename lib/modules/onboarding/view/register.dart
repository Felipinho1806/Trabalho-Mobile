import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF007BFF), Color(0xFF6A0DAD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Parte superior
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Image.asset('assets/images/logo.png', height: 100),
                    const SizedBox(height: 16),
                    Text(
                      "Cadastre-se",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Nome completo
                    _buildTextField("Nome completo", Icons.person),

                    const SizedBox(height: 16),

                    // E-mail
                    _buildTextField("E-mail", Icons.email),

                    const SizedBox(height: 16),

                    // Senha
                    _buildTextField("Senha", Icons.lock, obscure: true),

                    const SizedBox(height: 16),

                    // Confirmar senha
                    _buildTextField("Confirmar senha", Icons.lock, obscure: true),

                    const SizedBox(height: 16),

                    // Meta diária
                    _buildTextField("Meta diária (em horas)", Icons.timer),

                    const SizedBox(height: 16),

                    // Área de interesse
                    _buildTextField("Área de interesse", Icons.track_changes),
                  ],
                ),

                // Parte inferior
                Column(
                  children: [
                    const SizedBox(height: 20),

                    // Botão Cadastrar
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // ação futura: cadastro
                        },
                        child: Text(
                          "Cadastrar",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Botão Voltar ao Login
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Voltar ao Login",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método auxiliar para criar campos
  Widget _buildTextField(String hint, IconData icon, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
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
    );
  }
}