import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/modules/questionnaire/bloc/questionnaire_bloc.dart';
import 'package:measure_ap/modules/questionnaire/widgets/menu_item.dart';

class FingersDetailsQuestions extends StatelessWidget {
  const FingersDetailsQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GlobalTextWidget.hugeTitle("How many fingers do you see?"),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/6),
          child: const GlobalTextWidget.content(
            textAlign: TextAlign.center,
            "Please show the patient a certain amount of fingers and follow their reaction.",
            maxLines: 2,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          buildWhen: (previous, current) =>
              previous.assessmentData?.isCorrectFingers != current.assessmentData?.isCorrectFingers,
          builder: (context, state) {
            return Column(
              children: [
                MenuItem(
                  text: "Correct",
                  isSelected: state.assessmentData?.isCorrectFingers ?? false,
                  hasCheckBox: false,
                  callback: (){
                    context.read<QuestionnaireBloc>().add(const FingersShown(true));

                  },
                ),
                MenuItem(
                  text: "Incorrect",
                  isSelected: !(state.assessmentData?.isCorrectFingers ?? true),
                  hasCheckBox: false,
                  callback: (){
                    context.read<QuestionnaireBloc>().add(const FingersShown(false));
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
