import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/buttons/floating_button.dart';
import 'package:measure_ap/modules/home/bloc/home_bloc.dart';
import 'package:measure_ap/modules/home/widgets/home_header.dart';
import 'package:measure_ap/modules/home/widgets/patient_history_tab.dart';
import 'package:measure_ap/modules/home/widgets/recent_examination_tab.dart';
import 'package:measure_ap/modules/new_assessment/screens/assessment_screen.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 100;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const HeaderWithDate(),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: height * 40,
            child: const PatientHistoryTab(),
          ),
          SizedBox(
            height: height * 30,
            child: const RecentAssessmentTab(),
          ),
          FloatingButton(
              text: "New assessment",
              hasIcon: true,
              callback: () {
                Navigator.pushNamed(
                  context,
                  NewAssessmentScreen.routeName,
                ).then((value) {
                  bool? hasToRefresh = value as bool?;
                  if (hasToRefresh != null && hasToRefresh) {
                    context.read<HomeBloc>().add(const FetchHistory());
                  }
                });
              }),
        ],
      ),
    );
  }
}
