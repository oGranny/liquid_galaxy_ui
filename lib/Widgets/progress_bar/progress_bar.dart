import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final double width;
  final VoidCallback onComplete;
  final bool start;
  const ProgressBar(
      {super.key,
      required this.width,
      required this.onComplete,
      required this.start});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double _progress = 0.0;
  void startLoading() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_progress < 1.0) {
        if (_progress + 0.1 >= 1.0) {
          widget.onComplete();
        }
        setState(() {
          _progress += 0.1;
        });
        startLoading();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // _startLoading();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.start) {
      startLoading();
    }
    return Container(
      width: widget.width,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(color: Theme.of(context).disabledColor),
      ),
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).disabledColor,
            width: widget.width,
            height: 4,
            // decoration: BoxDecoration(
            //   color: Theme.of(context).disabledColor,
            //   borderRadius: BorderRadius.circular(15),
            // ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: widget.width * _progress,
            height: 7,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.horizontal(
                left: const Radius.circular(15),
                right:
                    _progress == 1.0 ? const Radius.circular(15) : Radius.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
