// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lg_ui_task/Widgets/progress_bar/progress_bar.dart';
import 'package:lg_ui_task/Widgets/progress_bar/progress_circle.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  bool done1 = false;
  bool done2 = false;

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProgressCircle(
              done: true,
              text: "Install",
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProgressBar(
                  width: totalWidth * 0.20,
                  start: true,
                  onComplete: () {
                    setState(() {
                      done1 = true;
                    });
                  },
                ),
                const SizedBox(height: 35),
              ],
            ),
            const SizedBox(width: 14),
            ProgressCircle(
              done: done1,
              text: "Connect",
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressBar(
                  width: totalWidth * 0.20,
                  start: done1,
                  onComplete: () {
                    setState(() {
                      done2 = true;
                    });
                  },
                ),
                const SizedBox(height: 35),
              ],
            ),
            const SizedBox(width: 14),
            ProgressCircle(
              done: done2,
              text: "Visualize",
            ),
          ],
        ),
      ),
    );
  }
}
