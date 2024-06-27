import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';
import 'package:measure_ap/modules/questionnaire/bloc/questionnaire_bloc.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GlobalTextWidget.hugeTitle("Confirm the result"),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black45, width: 1),
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          child: Column(
            children: [
              CircularIndicatorWithScore(),
              QuestionAnswers(),
            ],
          ),
        ),
      ],
    );
  }
}

class CircularIndicatorWithScore extends StatelessWidget {
  CircularIndicatorWithScore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: CircularProgressIndicator(
                    strokeWidth: 12,
                    backgroundColor: Colors.black12,
                    value: (state.assessmentData!.getScore()) / 18,
                    valueColor: const AlwaysStoppedAnimation<Color>(greenProgress),
                  ),
                ),
                // Center(
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         state.assessmentData!.getScore().toString(),
                //         style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black87),
                //       ),
                //       const Text(
                //         '/8',
                //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black45),
                //       ),
                //
                //     ],
                //   ),
                // ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: state.assessmentData?.getScore().toString(),
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black87),
                        children: const [
                          TextSpan(
                            text: "/18",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black45),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class QuestionAnswers extends StatelessWidget {
  QuestionAnswers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
      builder: (context, state) {
        return state.assessmentData!.getQuestionAnswerList();
      },
    );
  }
}
