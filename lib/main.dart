import 'package:flutter/material.dart';
import 'modules/onboarding/view/onboarding_screen.dart';
import 'modules/onboarding/view/login.dart';
import 'package:intl/date_symbol_data_local.dart'; 

void main() async { 
  WidgetsFlutterBinding.ensureInitialized(); 

  await initializeDateFormatting('pt_BR', null); 
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 debugShowCheckedModeBanner: false,
 title: 'Daily XP',
 initialRoute: '/onboarding',
 routes: {
 '/onboarding': (context) => const OnboardingScreen(),
 '/login': (context) => const LoginScreen(),
 },
 );
}
}