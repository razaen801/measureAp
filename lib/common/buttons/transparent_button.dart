import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Gradient? gradient;
  final double thickness;

  const TransparentButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.gradient,
    this.thickness = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: gradient),
      child: Container(
        margin: EdgeInsets.all(thickness),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 2,color: Colors.black45)
          ),
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: child,
          ),
        ),
      ),
    );
  }
}
