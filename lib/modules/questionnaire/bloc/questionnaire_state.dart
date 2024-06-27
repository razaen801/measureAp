part of 'questionnaire_bloc.dart';

enum QuestionnaireStatus {
  initial,
  inProgress,
  completed,
  error,
}

class QuestionnaireState extends Equatable {
  QuestionnaireStatus status;
  AssessmentData? assessmentData;
  int index;
  PatientAssessmentDetail? patientAssessmentDetails;

  QuestionnaireState({
    this.status = QuestionnaireStatus.initial,
    this.assessmentData,
    this.index = 0,
    this.patientAssessmentDetails,
  });

  QuestionnaireState copyWith({
    QuestionnaireStatus? status,
    AssessmentData? assessmentData,
    int? index,
    PatientAssessmentDetail? patientAssessmentDetails,
  }) {
    return QuestionnaireState(
      status: status ?? this.status,
      index: index ?? this.index,
      assessmentData: assessmentData ?? this.assessmentData,
      patientAssessmentDetails: patientAssessmentDetails ?? this.patientAssessmentDetails,
    );
  }

  @override
  List<Object?> get props => [
        status,
        assessmentData,
        patientAssessmentDetails,
        index,
      ];
}
