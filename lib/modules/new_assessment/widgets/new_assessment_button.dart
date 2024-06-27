import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/buttons/floating_button.dart';
import 'package:measure_ap/modules/new_assessment/bloc/assessment_bloc.dart';

class NewAssessmentButton extends StatelessWidget {
  const NewAssessmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssessmentBloc, AssessmentState>(
      buildWhen: (previous, current) => current.hasCompletedForm,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: FloatingButton(
            text: "Start Assessment",
            isDisabled: !state.hasCompletedForm,
            callback: () {
              context.read<AssessmentBloc>().add(const StartAssessment());
            },
          ),
        );
      },
    );
  }
}
