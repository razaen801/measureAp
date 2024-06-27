import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:measure_ap/common/buttons/floating_button.dart';
import 'package:measure_ap/common/buttons/transparent_button.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/modules/dashboard/screens/dashboard.dart';
import 'package:measure_ap/modules/questionnaire/widgets/correct_count.dart';

import '../../../utils/utilities.dart';
import '../bloc/questionnaire_bloc.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: BottomButtons(),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        bool hasPrevButton = state.index != 0;
        if (state.index == 4) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: TransparentButton(
                    onPressed: () {
                      Navigator.popUntil(context,ModalRoute.withName(Dashboard.routeName));
                      Navigator.pushReplacementNamed(
                        context,
                        Dashboard.routeName,
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GlobalTextWidget.title(
                        "Back",
                        isBold: true,
                        textColor: Colors.black45,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FloatingButton(
                  text: 'Print',
                  callback: () {
                    Utility.showToastMessage(message: "Feature will be available soon");
                  },
                ),
              )
            ],
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(state.index == 3)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: CorrectCount(),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasPrevButton)
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: TransparentButton(
                      onPressed: () {
                        context.read<QuestionnaireBloc>().add(const OnPrev());
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.black45),
                      ),
                    ),
                  ),
                FloatingButton(
                  text: state.index == 3 ? "Finish" : 'Continue',
                  callback: () {
                    context.read<QuestionnaireBloc>().add(const OnNext());
                  },
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
