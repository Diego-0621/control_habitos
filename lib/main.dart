
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ControlHabitosApp());
}

class ControlHabitosApp extends StatelessWidget {
  const ControlHabitosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Hábitos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomeScreen(),
    );
  }
}