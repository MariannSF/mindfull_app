import 'package:flutter/material.dart';
import 'package:mindfull_app_2/screens/intro_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IntroScreen()
    );
  }
}
