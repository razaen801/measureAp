import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measure_ap/core/firebase/firebase_helper.dart';

import '../../home/models/patient_assessment.dart';
import '../../new_assessment/models/assessment_data.dart';

part 'questionnaire_event.dart';
part 'questionnaire_state.dart';

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  QuestionnaireBloc() : super(QuestionnaireState()) {
    on<InitializeValue>(_initializeValue);
    on<OnNext>(_onNext);
    on<OnPrev>(_onPrev);
    on<FingersShown>(_onFingersShown);
    on<AnswersJillsLife>(_onAnsweringJillsLife);
    on<ReadSentence>(_onReadSentence);
    on<IdentifiesAnimals>(_onAnimalsIdentified);
  }

  FutureOr<void> _initializeValue(
    InitializeValue event,
    Emitter<QuestionnaireState> emit,
  ) {
    emit(
      state.copyWith(
        patientAssessmentDetails: event.detail,
        assessmentData: AssessmentData(assessmentId: event.detail.assessmentId!),
      ),
    );
  }

  FutureOr<void> _onFingersShown(
    FingersShown event,
    Emitter<QuestionnaireState> emit,
  ) {
    emit(
      state.copyWith(
        assessmentData: state.assessmentData!.copyWith(isCorrectFingers: event.isCorrect),
      ),
    );
  }

  FutureOr<void> _onNext(
    OnNext event,
    Emitter<QuestionnaireState> emit,
  ) async {
    if (state.index == 3) {
      await _saveToDb(state, emit);
    }
    else {
      _emitWithIncrement(emit);
    }
  }

  FutureOr<void> _onPrev(
    OnPrev event,
    Emitter<QuestionnaireState> emit,
  ) {
    var newIndex = state.index - 1;
    emit(state.copyWith(index: newIndex));
  }

  FutureOr<void> _onAnsweringJillsLife(
    AnswersJillsLife event,
    Emitter<QuestionnaireState> emit,
  ) {
    emit(
      state.copyWith(
        assessmentData: state.assessmentData!.copyWith(
          boughtCandies: event.boughtCandy,
          tookCab: event.tookCab,
          hasDog: event.hasDog,
        ),
      ),
    );
  }

  FutureOr<void> _onReadSentence(
    ReadSentence event,
    Emitter<QuestionnaireState> emit,
  ) {
    emit(
      state.copyWith(
        assessmentData: state.assessmentData!.copyWith(
          recalledSentence: true,
        ),
      ),
    );
  }

  FutureOr<void> _onAnimalsIdentified(
    IdentifiesAnimals event,
    Emitter<QuestionnaireState> emit,
  ) {
    emit(
      state.copyWith(
        assessmentData: state.assessmentData!.copyWith(
          hasIdentifiedChicken: event.identifiesChicken,
          hasIdentifiedDog: event.identifiesDog,
          hasIdentifiedHorse: event.identifiesHorse,
        ),
      ),
    );
  }

  void _emitWithIncrement(Emitter<QuestionnaireState> emit) {
    var newIndex = state.index + 1;
    emit(state.copyWith(index: newIndex));
  }

  // save to db once form is completed
  _saveToDb(
    QuestionnaireState state,
    Emitter<QuestionnaireState> emit,
  )async {
    try {
      emit(state.copyWith(status: QuestionnaireStatus.inProgress));

      await FirebaseDatabaseHelper.writePatientAssessmentDetail(state.patientAssessmentDetails!);
      await FirebaseDatabaseHelper.writeAssessmentData(state.assessmentData!);
      var newIndex = state.index + 1;

      emit(state.copyWith(status: QuestionnaireStatus.completed,index: newIndex));

    } catch (e) {
      emit(state.copyWith(status: QuestionnaireStatus.error));
      print(e);
    }
  }
}
