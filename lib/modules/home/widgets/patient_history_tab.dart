import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/error_message.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/common/widgets/loader.dart';
import 'package:measure_ap/common/widgets/no_data_widget.dart';
import 'package:measure_ap/modules/home/bloc/home_bloc.dart';
import 'package:measure_ap/modules/home/widgets/patient_history_item.dart';

class PatientHistoryTab extends StatelessWidget {
  const PatientHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GlobalTextWidget.title("Recent history"),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GlobalTextWidget.content("See more"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    size: 20,
                    Icons.arrow_right_alt,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
        BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state.homeStatus == HomeStatus.inProgress) {
            return const Loader();
          } else if (state.homeStatus == HomeStatus.success) {
            if (state.histories == null || state.histories!.isEmpty) {
              return const NoDataWidget();
            }
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * .35,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.histories!.length > 2 ? 2 : state.histories!.length,
                  itemBuilder: (context, index) {
                    return PatientHistoryItem(
                      detail: state.histories![index],
                    );
                  }),
            );
          } else {
            return const ErrorMessage();
          }
        }),
      ],
    );
  }
}
