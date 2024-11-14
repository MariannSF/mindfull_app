import 'package:flutter/material.dart';
import 'package:mindfull_app_2/screens/intro_screen.dart';
import 'package:mindfull_app_2/screens/setting_screen.dart';
import 'package:mindfull_app_2/screens/quote_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/quote': (context) => const QuoteScreen(),
      },
    );
  }
}
