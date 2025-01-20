// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SingleBar extends StatelessWidget {
  final Color color;
  final double widthpercent;
  final Duration duration;
  final bool showGlow;

  const SingleBar({
    super.key,
    required this.color,
    required this.widthpercent,
    required this.duration,
    this.showGlow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 4.5,
      width: MediaQuery.of(context).size.width * widthpercent,
      decoration: BoxDecoration(
        color: color,
        boxShadow: showGlow
            ? [
                BoxShadow(
                  color: color.withOpacity(0.8),
                  blurRadius: 30.0,
                  spreadRadius: 8,
                  offset: const Offset(0, -10),
                ),
              ]
            : [],
      ),
    );
  }
}
