import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/modules/history/bloc/history_bloc.dart';
import 'package:measure_ap/modules/history/widgets/history_item.dart';

import '../../../common/widgets/error_message.dart';
import '../../../common/widgets/loader.dart';
import '../../../common/widgets/no_data_widget.dart';

class HistoryContainer extends StatelessWidget {
  const HistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: GlobalTextWidget.hugeTitle("History",textAlign: TextAlign.left,),
              ),
              Expanded(
                child: BlocBuilder<HistoryBloc, HistoryState>(
                    builder: (context, state) {
                  if (state.status == HistoryStatus.inProgress) {
                    return const Center(child: Loader());
                  } else if (state.status == HistoryStatus.success) {
                    if (state.histories == null || state.histories!.isEmpty) {
                      return const Center(child: NoDataWidget());
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.histories!.length,
                        itemBuilder: (context, index) {
                          return HistoryItem(
                            detail: state.histories![index],
                          );
                        });
                  } else {
                    return const ErrorMessage();
                  }
                }),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
