import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';

class CustomToolbar extends StatelessWidget {
  final String text;
  final Function()? callbackAction;
  bool hasBackButton;

  CustomToolbar({super.key, required this.text, this.callbackAction, this.hasBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: kToolbarHeight,
        child: Stack(
          children: [
            if(hasBackButton)
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: callbackAction,
                child: const SizedBox(
                  height: kToolbarHeight,
                  width: kToolbarHeight,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                  ),
                ),
              ),
            ),
            Center(
              child: GlobalTextWidget.title(
                text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
