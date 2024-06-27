import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measure_ap/modules/home/models/patient_assessment.dart';

import '../../../core/firebase/firebase_helper.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent,HistoryState> {
  HistoryBloc() : super(HistoryState()) {
    on<FetchHistory>(_fetchHistory);
  }

  FutureOr<void> _fetchHistory(
    FetchHistory event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: HistoryStatus.inProgress,
        ),
      );
      final assessmentData = await FirebaseDatabaseHelper.readAllPatientAssessmentDetails();
      assessmentData.sort((a1, a2) => a1.dateTime.compareTo(a2.dateTime));
      emit(state.copyWith(
        status: HistoryStatus.success,
        histories: assessmentData.reversed.toList(),
      ));

    } catch (e) {
      log('$e');
      emit(state.copyWith(
        status: HistoryStatus.failed,
      ));
    }
  }
}
