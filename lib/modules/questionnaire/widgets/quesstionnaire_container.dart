import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/custom_toolbar.dart';
import 'package:measure_ap/modules/questionnaire/widgets/animal_identification_questions.dart';
import 'package:measure_ap/modules/questionnaire/widgets/buttons.dart';
import 'package:measure_ap/modules/questionnaire/widgets/final_page.dart';
import 'package:measure_ap/modules/questionnaire/widgets/jill_story_question.dart';
import 'package:measure_ap/modules/questionnaire/widgets/recall_question.dart';
import 'package:measure_ap/modules/questionnaire/widgets/stepper_widget.dart';

import '../../../utils/utilities.dart';
import '../bloc/questionnaire_bloc.dart';
import 'fingers_details.dart';

class QuestionnaireContainer extends StatelessWidget {
  const QuestionnaireContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (didPop) {
              return;
            }
            _showConfirmationDialog(context);
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomToolbar(
                text: 'Assessment',
                callbackAction: () {
                  _showConfirmationDialog(context);
                },
              ),
              const HorizontalStepper(),
              const SizedBox(height: 30,),
              const Expanded(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: QuestionnaireWidget(),
              )),
              const FooterButtons(),
            ],
          ),
        ),
      ),
    );
  }

  _showConfirmationDialog(BuildContext context) {
    Utility.showCustomDialog(
      context,
      title: "Warning",
      content: "You will lost all the saved data. Are you sure you want to exit?",
      okBtnText: "Yes",
      cancelBtnText: "No",
      okBtnFunction: () {
        Navigator.of(context).pop();
        Navigator.pop(context);
      },
    );
  }
}

class QuestionnaireWidget extends StatelessWidget {
  const QuestionnaireWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
      builder: (context, state) {
        if(state.index == 0){
          return const FingersDetailsQuestions();
        }
        if(state.index == 1){
          return const JillStoryQuestions();
        }
        if(state.index == 2){
          return const RecallQuestion();
        }
        if(state.index == 3){
          return const AnimalIdentificationQuestions();
        }
        if(state.index == 4){
          return const FinalPage();
        }
        else{
          return Container();
        }
      },
    );
  }
}

