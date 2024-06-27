import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measure_ap/modules/home/models/patient_assessment.dart';

part 'assessment_event.dart';
part 'assessment_state.dart';

class AssessmentBloc extends Bloc<AssessmentEvent, AssessmentState> {
  AssessmentBloc() : super(AssessmentState()) {
    on<OnCognitiveStatusChanged>(_onCognitiveStatusChanged);
    on<OnApplicableMeasureChanged>(_onApplicableMeasureChanged);
    on<OnPatientChanged>(_onPatientChanged);
    on<StartAssessment>(_startAssessment);
  }

  FutureOr<void> _onCognitiveStatusChanged(
    OnCognitiveStatusChanged event,
    Emitter<AssessmentState> emit,
  ) {
    emit(
      state.copyWith(
        data: PatientAssessmentDetail(
          PaId: Random().nextInt(10000),
          assessmentId: Random().nextInt(10000),
          dateTime: DateTime.now(),
          cognitionType: event.cognition,
        ),
      ),
    );
  }

  FutureOr<void> _onApplicableMeasureChanged(
    OnApplicableMeasureChanged event,
    Emitter<AssessmentState> emit,
  ) {
    emit(
      state.copyWith(
        data: state.data!.copyWith(
          applicableMeasures: event.applicableMeasures,
        ),
      ),
    );
  }

  FutureOr<void> _onPatientChanged(
    OnPatientChanged event,
    Emitter<AssessmentState> emit,
  ) {
    emit(
      state.copyWith(
        data: state.data!.copyWith(
          patientId: event.patientId,
        ),
      ),
    );
  }

  FutureOr<void> _startAssessment(
    StartAssessment event,
    Emitter<AssessmentState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AssessmentStatus.inProgress,
      ),
    );
    await Future.delayed(const Duration(seconds: 3), () {
      emit(
        state.copyWith(
          status: AssessmentStatus.success,
        ),
      );
    });
  }
}
