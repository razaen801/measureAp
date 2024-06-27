import 'package:flutter/material.dart';

class DotSignSplitter extends StatelessWidget {
  final Color? color;
  const DotSignSplitter({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: color ?? Colors.black54,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
