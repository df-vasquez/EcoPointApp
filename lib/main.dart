import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Importamos la pantalla de login

void main() {
  runApp(const EcoPointApp());
}

class EcoPointApp extends StatelessWidget {
  const EcoPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoPoint',
      theme: ThemeData(
        primarySwatch: Colors.green, // Color principal de la app
      ),
      home: const LoginScreen(), // Pantalla inicial
    );
  }
}