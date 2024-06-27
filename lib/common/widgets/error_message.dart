import 'package:flutter/material.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: secondaryColor,
            size: 30,
          ),
          const SizedBox(
            height: 12,
          ),
          const GlobalTextWidget.tooltip("Something went wrong. Please try again!")
        ],
      ),
    );
  }
}
