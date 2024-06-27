import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/modules/questionnaire/bloc/questionnaire_bloc.dart';

import '../../../common/widgets/global_text_widget.dart';
import '../../../constants/colors_sizes.dart';

class CorrectCount extends StatelessWidget {
  const CorrectCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
      buildWhen: (previous, current) =>
      (previous.assessmentData?.hasIdentifiedDog != current.assessmentData?.hasIdentifiedDog) ||
      (previous.assessmentData?.hasIdentifiedHorse != current.assessmentData?.hasIdentifiedHorse) ||
      (previous.assessmentData?.hasIdentifiedChicken != current.assessmentData?.hasIdentifiedChicken),
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalTextWidget.title(
              "${state.assessmentData!.getAnimalCorrectCount().toString()} correct",
              textColor: orangeTips,
              isBold: true,
            ),
          ],
        );
      },
    );
  }
}