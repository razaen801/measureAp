import 'package:flutter/material.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';

class FloatingButton extends StatelessWidget {
  final String text;
  bool hasIcon;
  bool isDisabled;
  Function()? callback;
  bool hasPadding;

  FloatingButton({
    super.key,
    required this.text,
    this.hasIcon = false,
    this.isDisabled = false,
    this.callback,
    this.hasPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hasPadding ? 24.0 :0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: !isDisabled
                  ? [
                      // BoxShadow(
                      //   color: Colors.red.withOpacity(0.5),
                      //   offset: Offset(-10, 10),
                      //   blurRadius: 20.0,
                      // ),
                      // BoxShadow(
                      //   color: Colors.red.withOpacity(0.5),
                      //   offset: Offset(10, 10),
                      //   blurRadius: 20.0,
                      // ),
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.5),
                        // offset: Offset(0, -10),
                        blurRadius: 20.0,
                      ),
                      // BoxShadow(
                      //   color: Colors.purple.withOpacity(0.5),
                      //   offset: Offset(10, -10),
                      //   blurRadius: 20.0,
                      // ),
                      // BoxShadow(
                      //   color: Colors.orange.withOpacity(0.5),
                      //   offset: Offset(-10, -10),
                      //   blurRadius: 20.0,
                      // ),
                    ]
                  : null,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDisabled ? Colors.grey : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: callback,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    hasIcon
                        ? const Icon(
                            Icons.add,
                            color: Colors.white,
                          )
                        : const SizedBox.shrink(),
                    GlobalTextWidget.title(
                      text,
                      textAlign: TextAlign.center,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
