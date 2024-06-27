part of 'assessment_bloc.dart';

enum AssessmentStatus {
  initial,
  inProgress,
  success,
}

class AssessmentState extends Equatable {
  AssessmentStatus? status;
  PatientAssessmentDetail? data;

  AssessmentState({
    this.status = AssessmentStatus.initial,
    this.data,
  });

  bool get hasCompletedForm =>
      data?.patientId != null && data?.cognitionType != null && data?.applicableMeasures != null;

  bool get hasFilledCognition => data?.cognitionType != null;

  bool get hasFilledApplicableMeasure => data?.applicableMeasures != null;

  AssessmentState copyWith({
    AssessmentStatus? status,
    PatientAssessmentDetail? data,
  }) {
    return AssessmentState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, data];
}
