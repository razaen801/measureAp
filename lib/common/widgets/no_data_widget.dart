import 'package:flutter/material.dart';

import '../../constants/colors_sizes.dart';
import 'global_text_widget.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add_comment_outlined,
            color: secondaryColor,
            size: 50,
          ),
          const SizedBox(
            height: 12,
          ),
          const GlobalTextWidget.tooltip("No data found! Please add assessments")
        ],
      ),
    );

  }
}
