import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/modules/questionnaire/bloc/questionnaire_bloc.dart';

import '../../../utils/symmetric_shape_border.dart';

class HorizontalStepper extends StatelessWidget {
  const HorizontalStepper({super.key});

  Widget _getContainerOfType(bool isDark,BuildContext context){
    return Container(
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width/8,
      decoration: BoxDecoration(
        color: isDark ? Colors.black87 : Colors.grey,
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
    );
  }

  _getWidgets(int index, BuildContext context){
    List<Widget> widgets = [];
    for(int i=0; i<5; i++){
      if(i<=index){
        widgets.add(_getContainerOfType(true, context));
      }
      else{
        widgets.add(_getContainerOfType(false, context));
      }
    }
    return widgets;
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 21.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _getWidgets(state.index, context),
          ),
        );
      },
    );
  }

}


