import 'package:flutter/material.dart';
import 'package:lg_ui_task/Widgets/google_bar/voice_bar.dart';

class GlowingGoogleBar extends StatefulWidget {
  final Function(AnimationController)? onControllerCreated;
  const GlowingGoogleBar({super.key, this.onControllerCreated});

  @override
  State<GlowingGoogleBar> createState() => _GlowingGoogleBarState();
}

class _GlowingGoogleBarState extends State<GlowingGoogleBar>
    with SingleTickerProviderStateMixin {
  double progress = 0.25;
  double greenWidthPercent = 0.25;
  static late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    if (widget.onControllerCreated != null) {
      widget.onControllerCreated!(_controller);
    }

    _animation = Tween<double>(begin: 0.00, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          if (_animation.value < .5) {
            greenWidthPercent = _animation.value * .4 + .05;
          } else {
            greenWidthPercent = 1.6 * _animation.value * _animation.value +
                _animation.value * -1.2 +
                .45;
          }
          progress = _animation.value * _animation.value * -.8 +
              .8 * _animation.value +
              .05;
        });
      });
    // _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VoiceBar(
          redWidthPercent: progress,
          yellowWidthPercent: progress,
          greenWidthPercent: greenWidthPercent,
        ),
      ],
    );
  }
}
