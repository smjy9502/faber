import 'package:flutter/material.dart';
import '../widgets/animated_card.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedCard(),
      ),
    );
  }
}
