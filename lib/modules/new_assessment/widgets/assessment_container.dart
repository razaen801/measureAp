import 'package:flutter/material.dart';
import 'package:measure_ap/modules/new_assessment/widgets/applicable_measure_state.dart';
import 'package:measure_ap/modules/new_assessment/widgets/cognitive_status.dart';
import 'package:measure_ap/modules/new_assessment/widgets/new_assessment_button.dart';
import 'package:measure_ap/modules/new_assessment/widgets/patient_autocomplete_field.dart';

import '../../../common/widgets/custom_toolbar.dart';

class NewAssessmentContainer extends StatelessWidget {
  const NewAssessmentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomToolbar(
              text: "New Assessment",
              callbackAction: () {
                Navigator.pop(context);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CognitionStatusDropDown(),
                  ApplicationMeasureDropDown(),
                  PatientAutoCompleteField(),
                ],
              ),
            ),
            Expanded(child: Container()),
            const NewAssessmentButton(),
          ],
        ),
      ),
    );
  }
}
