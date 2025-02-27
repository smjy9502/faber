import 'package:flutter/material.dart';
import 'screens/question_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Faber',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuestionScreen(),
    );
  }
}
