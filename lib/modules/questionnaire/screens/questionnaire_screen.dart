import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/full_screen_loader.dart';
import 'package:measure_ap/modules/home/models/patient_assessment.dart';
import 'package:measure_ap/modules/questionnaire/widgets/quesstionnaire_container.dart';
import 'package:measure_ap/utils/utilities.dart';

import '../bloc/questionnaire_bloc.dart';

class QuestionnaireScreen extends StatelessWidget {
  static const routeName = '/questionnaire';

  const QuestionnaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patientAssessmentDetails = ModalRoute.of(context)!.settings.arguments as PatientAssessmentDetail;
    log(patientAssessmentDetails.toString());

    return BlocProvider<QuestionnaireBloc>(
      create: (context) => QuestionnaireBloc()..add(InitializeValue(patientAssessmentDetails)),
      child: BlocListener<QuestionnaireBloc, QuestionnaireState>(
        listener: (context, state) {
          if (state.status == QuestionnaireStatus.inProgress) {
            LoaderPrimaryFull.show(context, key: const ObjectKey("submitting"),loadingText: "Saving data. Please wait!!!");
          }
          if (state.status == QuestionnaireStatus.completed) {
            log('completed');
            LoaderPrimaryFull.hide(context);
            Utility.showToastMessage(message: "Data saved successfully");
          }
          if (state.status == QuestionnaireStatus.error) {
            LoaderPrimaryFull.hide(context);
            Utility.showToastMessage(isErrorMessage: true, message: "Something went wrong.");
          }
        },
        child: const QuestionnaireContainer(),
      ),
    );
  }
}
