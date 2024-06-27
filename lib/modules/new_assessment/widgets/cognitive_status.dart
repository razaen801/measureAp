import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';

import '../bloc/assessment_bloc.dart';

class CognitionStatusDropDown extends StatelessWidget {
  const CognitionStatusDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems = ['Cognition', 'Z00.00', 'Z05.12', 'Z22.63'];

    return BlocBuilder<AssessmentBloc, AssessmentState>(
      buildWhen: (previous, current) => previous.data?.cognitionType != current.data?.cognitionType,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalTextWidget.content("Cognitive status",isBold: true,),
            const SizedBox(height: 2,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: DropdownButton(
                  underline: const SizedBox.shrink(),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  hint: const GlobalTextWidget.content('Select Cognitive Status'),
                  items: dropdownItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: GlobalTextWidget.content(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<AssessmentBloc>().add(
                            OnCognitiveStatusChanged(value.toString()),
                          );
                    }
                  },
                  value: state.data?.cognitionType,
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
