import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/full_screen_loader.dart';
import 'package:measure_ap/modules/new_assessment/bloc/assessment_bloc.dart';
import 'package:measure_ap/modules/new_assessment/widgets/assessment_container.dart';
import 'package:measure_ap/modules/questionnaire/screens/questionnaire_screen.dart';

import '../../home/models/patient_assessment.dart';

class NewAssessmentScreen extends StatelessWidget {
  static const routeName = "/new_assessment";

  const NewAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final patientAssessmentDetails = ModalRoute.of(context)!.settings.arguments as PatientAssessmentDetail?;

    var assessmentBlocInstance = AssessmentBloc();
    if(patientAssessmentDetails!=null){
      assessmentBlocInstance.add(OnCognitiveStatusChanged(patientAssessmentDetails.cognitionType!));
      assessmentBlocInstance.add(OnApplicableMeasureChanged(patientAssessmentDetails.applicableMeasures!));
    }


    return BlocProvider<AssessmentBloc>(
      create: (context) => assessmentBlocInstance,
      child: BlocListener<AssessmentBloc, AssessmentState>(
        listener: (context, state) {
          if (state.status == AssessmentStatus.inProgress) {
            LoaderPrimaryFull.show(context, key: const ObjectKey('assessment'));
          }
          if (state.status == AssessmentStatus.success) {
            LoaderPrimaryFull.hide(context);
            Navigator.pushNamed(
              context,
              QuestionnaireScreen.routeName,
              arguments: state.data,
            );
          }
        },
        child: const NewAssessmentContainer(),
      ),
    );
  }
}
