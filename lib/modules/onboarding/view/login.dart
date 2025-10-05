import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    Image.asset('assets/images/logo.png', height: 120),
                    const SizedBox(height: 20),
                    Text(
                      "Daily XP",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Campo Usuário
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person, color: Colors.white),
                        hintText: "Usuário",
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

                    const SizedBox(height: 16),

                    // Campo Senha
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        hintText: "Senha",
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

                    const SizedBox(height: 12),

                    // Esqueci minha senha
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Esqueci minha senha",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Botão Login
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
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Botão Google
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        icon: Image.asset('assets/images/google_icon.png', height: 24),
                        label: Text(
                          "Continuar com o Google",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Parte inferior (botão Cadastre-se)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
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
                        // Navegação para tela de cadastro
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: Text(
                        "Cadastre-se",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                        ),
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