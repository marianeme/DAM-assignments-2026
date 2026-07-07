import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedido Flash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF5A1F),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF5A1F),
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: false,
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Pedido Flash"),
          ),
      ),
    );
  }
}