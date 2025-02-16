import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'photo_screen.dart';
import 'video_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/concert_main.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 360),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDottedButton('Photo', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PhotoScreen()),
                    );
                  }),
                  const SizedBox(width: 20),
                  _buildDottedButton('Video', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VideoScreen()),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDottedButton(String text, VoidCallback onPressed) {
    return DottedBorder(
      color: Colors.white,
      strokeWidth: 2,
      dashPattern: const [5, 5],
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
