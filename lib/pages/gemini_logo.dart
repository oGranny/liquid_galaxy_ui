import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GeminiLogo extends StatefulWidget {
  const GeminiLogo({super.key});

  @override
  State<GeminiLogo> createState() => _GeminiLogoState();
}

class _GeminiLogoState extends State<GeminiLogo> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: SizedBox(
              width: 150,
              height: 150,
              child: Lottie.asset(
                'assets/lottie/Gemini_gradient.json',
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_controller.isAnimating) {
                _controller.stop();
              } else {
                _controller.forward(from: 0.0);
              }
            },
            child: SizedBox(
              width: 100,
              height: 100,
              child: Lottie.asset(
                  animate: false,
                  controller: _controller,
                  'assets/lottie/Gemini_logo.json',
                  fit: BoxFit.cover, onLoaded: (composition) {
                _controller.duration = composition.duration;
              }),
            ),
          ),
        ],
      ),
    );
  }
}
