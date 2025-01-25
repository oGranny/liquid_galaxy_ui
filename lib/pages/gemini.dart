import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class Gemini extends StatefulWidget {
  const Gemini({super.key});

  @override
  State<Gemini> createState() => _GeminiState();
}

class _GeminiState extends State<Gemini> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.forward(from: 0.0);
          }
          print("button clicked");
          setState(() {});
        },
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .5,
                child: const RiveAnimation.asset(
                  'assets/lottie/gemini_logo.riv',
                  speedMultiplier: .5,
                ),
              ),
            ),
            Center(
              child: Lottie.asset(
                  height: 100,
                  width: 100,
                  animate: false,
                  controller: _controller,
                  'assets/lottie/Gemini_logo.json',
                  fit: BoxFit.cover, onLoaded: (composition) {
                _controller.duration = composition.duration;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
