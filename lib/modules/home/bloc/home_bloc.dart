import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../core/firebase/firebase_helper.dart';
import '../models/patient_assessment.dart';
import '../models/patient_details.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<FetchHistory>(_fetchHistory);
  }

  FutureOr<void> _fetchHistory(FetchHistory event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(
          homeStatus: HomeStatus.inProgress,
        ),
      );
      final assessmentData = await FirebaseDatabaseHelper.readAllPatientAssessmentDetails();
      assessmentData.sort((a1, a2) => a1.dateTime.compareTo(a2.dateTime));
      emit(state.copyWith(
        homeStatus: HomeStatus.success,
        histories: assessmentData.reversed.toList(),
      ));

    } catch (e) {
      log('$e');
      emit(state.copyWith(
        homeStatus: HomeStatus.failed,
      ));
    }
  }
}
