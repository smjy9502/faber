import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({Key? key}) : super(key: key);

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> answers = ["Yes!", "No!", "Maybe.."];

  String get randomAnswer => answers[Random().nextInt(answers.length)];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: pi).animate(_controller);
  }

  void _startAnimation() async {
    await _controller.forward();
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _startAnimation(),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final isFlipped = _animation.value > pi / 2;
          return Transform(
            alignment: Alignment.center,
            transform:
            Matrix4.rotationY(isFlipped ? pi - _animation.value : _animation.value),
            child:
            isFlipped ? _buildAnswerBox() : _buildCardBack(),
          );
        },
      ),
    );
  }

  Widget _buildCardBack() {
    return Image.asset('assets/images/card_back_01.jpg', width: 200, height: 300);
  }

  Widget _buildAnswerBox() {
    return Container(
      width: 200,
      height: 300,
      color: Colors.blueAccent,
      alignment: Alignment.center,
      child:
      Text(randomAnswer, style: const TextStyle(color: Colors.white, fontSize: 24)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
