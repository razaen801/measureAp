import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/modules/questionnaire/bloc/questionnaire_bloc.dart';
import 'package:measure_ap/modules/questionnaire/widgets/menu_item.dart';

class RecallQuestion extends StatelessWidget {
  const RecallQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GlobalTextWidget.content("Recall question: "),
        const SizedBox(
          height: 16,
        ),
        const GlobalTextWidget.hugeTitle("Read the sentences"),
        const SizedBox(
          height: 16,
        ),
        GlobalTextWidget.content(
          textAlign: TextAlign.center,
          loremIpsum(words: 80, paragraphs: 3, initWithLorem: true),
          maxLines: 25,
        ),
      ],
    );
  }
}
