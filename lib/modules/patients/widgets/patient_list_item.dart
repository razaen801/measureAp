import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:measure_ap/common/widgets/container_with_tinted_back.dart';
import 'package:measure_ap/common/widgets/dot_sign.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/modules/home/models/patient_assessment.dart';
import 'package:measure_ap/modules/home/models/patient_details.dart';
import 'package:measure_ap/utils/utilities.dart';

import '../../../constants/assets_paths.dart';
import '../../../utils/symmetric_shape_border.dart';

class PatientListItem extends StatelessWidget {
  final PatientDetails detail;

  const PatientListItem({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 6,
        shape: const SymmetricShapeBorder(borderRadius: 16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalTextWidget.title(detail.name ?? '-'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GlobalTextWidget.content(
                        detail.gender ?? '-',
                        isBold: true,
                      ),
                      const DotSignSplitter(),
                      GlobalTextWidget.content('${Utility.getAgeFromDOB(detail.dob!)} Years old',
                          isBold: true),
                      const DotSignSplitter(),
                      GlobalTextWidget.content('${detail.weight ?? '-'} kg', isBold: true),
                    ],
                  ),
                  GlobalTextWidget.content(detail.dob!, isBold: true)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
