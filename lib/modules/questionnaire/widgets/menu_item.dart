import 'package:flutter/material.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool hasCheckBox;
  final Function() callback;

  const MenuItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.hasCheckBox,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: isSelected ? secondaryColor : Colors.black45, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 12.0),
          child: Row(
            children: [
              if (hasCheckBox)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
                    size: 32,
                    color: isSelected ? secondaryColor : Colors.black45,
                  ),
                ),
              GlobalTextWidget.title(text),
            ],
          ),
        ),
      ),
    );
  }
}
