import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';

import '../bloc/assessment_bloc.dart';

class ApplicationMeasureDropDown extends StatelessWidget {
  const ApplicationMeasureDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems = ['SLUMS', 'Physical Examination', 'Diagnostic Tests'];

    return BlocBuilder<AssessmentBloc, AssessmentState>(
      buildWhen: (previous, current) =>
          (previous.data?.applicableMeasures != current.data?.applicableMeasures) || current.hasFilledCognition,
      builder: (context, state) {
        bool isDisabled = !state.hasFilledCognition;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const GlobalTextWidget.content("Applicable measures",isBold: true,),
            const SizedBox(height: 2,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: isDisabled ? basicDisabled : Colors.black45, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: DropdownButton(
                  underline: const SizedBox.shrink(),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  hint: GlobalTextWidget.content(
                    'Select applicable measures',
                    textColor: isDisabled ? basicDisabled : null,
                  ),
                  items: dropdownItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: GlobalTextWidget.content(item),
                    );
                  }).toList(),
                  onChanged: isDisabled
                      ? null
                      : (value) {
                          if (value != null) {
                            context.read<AssessmentBloc>().add(
                                  OnApplicableMeasureChanged(value.toString()),
                                );
                          }
                        },
                  value: state.data?.applicableMeasures,
                  isExpanded: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
