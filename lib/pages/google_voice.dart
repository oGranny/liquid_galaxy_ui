import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lg_ui_task/Widgets/google_bar/google_bar.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class AnimatedBarPage extends StatefulWidget {
  const AnimatedBarPage({super.key});

  @override
  State<AnimatedBarPage> createState() => _AnimatedBarPageState();
}

class _AnimatedBarPageState extends State<AnimatedBarPage> {
  AnimationController? externalController;
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = "";

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    print(_speechEnabled);
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    externalController!.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      // externalController!.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: GlowingGoogleBar(
                onControllerCreated: (controller) {
                  externalController = controller;
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_speechToText.isNotListening) {
                    externalController!.forward();
                    _startListening();
                  } else {
                    externalController!.stop();
                    // externalController!.animateTo(0);
                    _stopListening();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).splashColor.withOpacity(.2),
                  minimumSize: const Size(100, 100),
                  shape: const CircleBorder(),
                  iconSize: 40,
                  padding: const EdgeInsets.all(20),
                ),
                child: SvgPicture.asset(
                  'assets/Images/google_mic.svg',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Positioned(
                bottom: 200,
                left: 0,
                right: 0,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Text(
                    _speechToText.isListening || _lastWords.isNotEmpty
                        ? _lastWords
                        : 'How can I help you?',
                    key: ValueKey<String>(_lastWords),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
