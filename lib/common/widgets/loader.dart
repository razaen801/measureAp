import 'package:flutter/material.dart';

import 'global_text_widget.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 12,),
          GlobalTextWidget.tooltip("Fetching data. Please wait...")
        ],
      ),
    );
  }
}
