import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  final bool done;
  final String text;
  const ProgressCircle({super.key, required this.done, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color: done
              ? Theme.of(context).primaryColor
              : Theme.of(context).disabledColor,
          size: 30,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          done ? "Completed" : "Pending",
          style: TextStyle(
            color: done
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
