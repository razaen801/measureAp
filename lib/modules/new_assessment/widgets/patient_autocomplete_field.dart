import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/dummy_data/patients.dart';
import 'package:measure_ap/constants/colors_sizes.dart';
import 'package:measure_ap/modules/home/models/patient_details.dart';
import 'package:measure_ap/modules/new_assessment/bloc/assessment_bloc.dart';

import '../../../common/widgets/global_text_widget.dart';

class PatientAutoCompleteField extends StatelessWidget {
  const PatientAutoCompleteField({super.key});

  @override
  Widget build(BuildContext context) {
    String displayStringForOption(PatientDetails option) => option.name!;

    return BlocBuilder<AssessmentBloc, AssessmentState>(
      buildWhen: (previous, current) =>
          (previous.data?.patientId != current.data?.patientId) || current.hasFilledApplicableMeasure,
      builder: (context, state) {
        bool isDisabled = !state.hasFilledApplicableMeasure;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const GlobalTextWidget.content(
              "Patient",
              isBold: true,
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: isDisabled ? basicDisabled : Colors.black54),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Autocomplete<PatientDetails>(
                displayStringForOption: displayStringForOption,
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<PatientDetails>.empty();
                  }

                  return allPatient.where((PatientDetails option) {
                    return option.toString().contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (PatientDetails selection) {
                  context.read<AssessmentBloc>().add(OnPatientChanged(selection.patientId));
                },
                fieldViewBuilder: ((context, textEditingController, focusNode, onFieldSubmitted) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      maxLines: 1,
                      enabled: state.hasFilledApplicableMeasure,
                      controller: textEditingController,
                      focusNode: focusNode,
                      onEditingComplete: onFieldSubmitted,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                          hintStyle: TextStyle(color: basicDisabled), hintText: 'Enter patient name or ID'),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
