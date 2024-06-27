import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/modules/history/bloc/history_bloc.dart';
import 'package:measure_ap/modules/history/widgets/history_container.dart';

class HistoryScreen extends StatelessWidget {

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (context) => HistoryBloc()
        ..add(
          const FetchHistory(),
        ),
      child: const HistoryContainer(),
    );
  }
}
