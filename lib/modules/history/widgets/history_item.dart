import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:measure_ap/common/widgets/container_with_tinted_back.dart';
import 'package:measure_ap/common/widgets/dot_sign.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/modules/home/models/patient_assessment.dart';
import 'package:measure_ap/utils/utilities.dart';

import '../../../constants/assets_paths.dart';
import '../../../utils/symmetric_shape_border.dart';

class HistoryItem extends StatelessWidget {
  final PatientAssessmentDetail detail;

  const HistoryItem({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 6,
        shape: const SymmetricShapeBorder(borderRadius: 16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Expanded(
                      flex: 8,
                      child: ContainerWithTint(
                        titleText: detail.cognitionType ?? '-',

                        contentText: detail.applicableMeasures ?? '-',
                      )),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: SvgPicture.asset(rightArrowSvg),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GlobalTextWidget.title(detail.patient.name ?? '-'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GlobalTextWidget.content(
                        detail.patient.gender ?? '-',
                        isBold: true,
                      ),
                      const DotSignSplitter(),
                      GlobalTextWidget.content('${Utility.getAgeFromDOB(detail.patient.dob!)} Years old',
                          isBold: true),
                      const DotSignSplitter(),
                      GlobalTextWidget.content('${detail.patient.weight ?? '-'} kg', isBold: true),
                    ],
                  ),
                  GlobalTextWidget.content(DateFormat('dd.MM.yyyy.').format(detail.dateTime), isBold: true)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
