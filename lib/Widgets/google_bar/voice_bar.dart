import 'package:flutter/material.dart';
import 'package:lg_ui_task/Widgets/google_bar/single_bar.dart';

class VoiceBar extends StatelessWidget {
  final double redWidthPercent;
  final double yellowWidthPercent;
  final double greenWidthPercent;

  const VoiceBar(
      {super.key,
      required this.redWidthPercent,
      required this.yellowWidthPercent,
      required this.greenWidthPercent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SingleBar(
          color: Colors.blue,
          widthpercent:
              1 - (redWidthPercent + yellowWidthPercent + greenWidthPercent),
          duration: const Duration(milliseconds: 500),
        ),
        SingleBar(
          color: Colors.red,
          widthpercent: redWidthPercent,
          duration: const Duration(milliseconds: 500),
        ),
        SingleBar(
          color: Colors.yellow,
          widthpercent: yellowWidthPercent,
          duration: const Duration(milliseconds: 500),
        ),
        SingleBar(
          color: Colors.green,
          widthpercent: greenWidthPercent,
          duration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
