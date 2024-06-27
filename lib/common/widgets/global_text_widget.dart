import 'package:flutter/material.dart';

class GlobalTextWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? textColor;
  final bool isBold;
  final double fontSize;
  final int maxLines;

  const GlobalTextWidget.title(
    this.text, {
    super.key,
    this.textAlign,
    this.textColor = Colors.black,
    this.isBold = true,
    this.fontSize = 18,
    this.maxLines = 1,
  });

  const GlobalTextWidget.hugeTitle(
    this.text, {
    super.key,
    this.textAlign,
    this.textColor = Colors.black,
    this.isBold = true,
    this.fontSize = 24,
    this.maxLines = 1,
  });

  const GlobalTextWidget.content(
    this.text, {
    super.key,
    this.textAlign,
    this.textColor = Colors.black45,
    this.isBold = false,
    this.fontSize = 14,
    this.maxLines = 1,
  });

  const GlobalTextWidget.tooltip(
    this.text, {
    super.key,
    this.textAlign,
    this.textColor = Colors.black45,
    this.isBold = false,
    this.fontSize = 10,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: textColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
      ),
    );
  }
}
