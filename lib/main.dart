import 'package:flutter/material.dart';
import 'package:drawing_board/screens/drawing_screen.dart';
import 'package:provider/provider.dart';
import 'package:drawing_board/models/drawing_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => DrawingModel(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing Board',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DrawingScreen(),
    );
  }
}