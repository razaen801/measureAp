import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:measure_ap/common/widgets/container_with_tinted_back.dart';
import 'package:measure_ap/constants/colors_sizes.dart';
import 'package:measure_ap/modules/home/models/patient_assessment.dart';

import '../../../constants/assets_paths.dart';
import '../../../utils/symmetric_shape_border.dart';
import '../../new_assessment/screens/assessment_screen.dart';
import '../bloc/home_bloc.dart';

class RecentAssessmentItem extends StatelessWidget {
  final PatientAssessmentDetail detail;

  const RecentAssessmentItem({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            NewAssessmentScreen.routeName,
            arguments: detail,
          ).then((value) {
            bool? hasToRefresh = value as bool?;
            if (hasToRefresh != null && hasToRefresh) {
              context.read<HomeBloc>().add(const FetchHistory());
            }
          });
        },
        child: Card(
          elevation: 6,
          surfaceTintColor: Colors.white,
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
                          hasPrimaryColor: false,
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
                            child: SvgPicture.asset(
                              rightArrowSvg,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
