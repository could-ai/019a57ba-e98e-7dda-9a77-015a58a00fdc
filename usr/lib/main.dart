import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sinyal Trading',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F2630),
          brightness: Brightness.dark,
          background: const Color(0xFF12171C),
          primary: const Color(0xFF2A9DF4),
          secondary: const Color(0xFF4CAF50),
          error: const Color(0xFFF44336),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
