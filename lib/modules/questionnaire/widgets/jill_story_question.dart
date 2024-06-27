import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';
import 'package:measure_ap/modules/questionnaire/bloc/questionnaire_bloc.dart';
import 'package:measure_ap/modules/questionnaire/widgets/menu_item.dart';
import 'package:measure_ap/utils/utilities.dart';

class JillStoryQuestions extends StatelessWidget {
  const JillStoryQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GlobalTextWidget.hugeTitle('Story"Jill Went to the shop"'),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 6),
          child: const GlobalTextWidget.content(
            textAlign: TextAlign.center,
            "Jill went to the shop to buy candies. Afterwards instead of walking home, she took a cab. When she arrived home, she found her cat waiting at the door. She fed her cat and then sat down to enjoy her candies while watching her favorite TV show. Later, she called her friend to share the news about her day.",
            maxLines: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: GestureDetector(
            onTap: () {
              Utility.showCustomDialog(context,
                  title: "Jill Went to the shop",
                  content:
                      "Jill went to the shop to buy candies. Afterwards instead of walking home, she took a cab. When she arrived home, she found her cat waiting at the door. She fed her cat and then sat down to enjoy her candies while watching her favorite TV show. Later, she called her friend to share the news about her day.",
                  okBtnFunction: () {
                Navigator.pop(context);
              });
            },
            child: GlobalTextWidget.content(
              "Show all",
              textColor: orangeTips,
              isBold: true,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          buildWhen: (previous, current) =>
              previous.assessmentData?.boughtCandies != current.assessmentData?.boughtCandies,
          builder: (context, state) {
            return MenuItem(
              text: "Jill bought candies.",
              isSelected: state.assessmentData?.boughtCandies ?? false,
              hasCheckBox: true,
              callback: () {
                context.read<QuestionnaireBloc>().add(
                      AnswersJillsLife(
                        boughtCandy: !(state.assessmentData?.boughtCandies ?? false),
                      ),
                    );
              },
            );
          },
        ),
        BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          buildWhen: (previous, current) => previous.assessmentData?.hasDog != current.assessmentData?.hasDog,
          builder: (context, state) {
            return MenuItem(
              text: "Jill has a dog as a pet.",
              isSelected: state.assessmentData?.hasDog ?? false,
              hasCheckBox: true,
              callback: () {
                context.read<QuestionnaireBloc>().add(
                      AnswersJillsLife(
                        hasDog: !(state.assessmentData?.hasDog ?? false),
                      ),
                    );
              },
            );
          },
        ),
        BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          buildWhen: (previous, current) => previous.assessmentData?.tookCab != current.assessmentData?.tookCab,
          builder: (context, state) {
            return MenuItem(
              text: "Jill took a cab.",
              isSelected: state.assessmentData?.tookCab ?? false,
              hasCheckBox: true,
              callback: () {
                context.read<QuestionnaireBloc>().add(
                      AnswersJillsLife(
                        tookCab: !(state.assessmentData?.tookCab ?? false),
                      ),
                    );
              },
            );
          },
        ),
      ],
    );
  }
}
