import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/cadastro.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily XP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
      ),
      initialRoute: '/login', // Tela inicial
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
