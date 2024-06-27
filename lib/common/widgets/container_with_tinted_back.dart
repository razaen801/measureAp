import 'package:flutter/material.dart';
import 'package:measure_ap/common/widgets/dot_sign.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';

import '../../utils/symmetric_shape_border.dart';

class ContainerWithTint extends StatelessWidget {
  String titleText;
  String contentText;
  bool hasPrimaryColor;

  ContainerWithTint({
    super.key,
    this.hasPrimaryColor = true,
    required this.titleText,
    required this.contentText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: hasPrimaryColor? primaryColorLight.withOpacity(0.4): secondaryColor.withOpacity(0.2),
      shape: const SymmetricShapeBorder(borderRadius: 30),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GlobalTextWidget.content(
              titleText,
              isBold: true,
              textColor: hasPrimaryColor ? primaryColor : secondaryColor,
            ),
            DotSignSplitter(color: hasPrimaryColor ? primaryColor : secondaryColor),
            GlobalTextWidget.content(
              contentText,
              textColor: hasPrimaryColor ? primaryColor : secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
