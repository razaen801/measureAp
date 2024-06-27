part of 'assessment_bloc.dart';

sealed class AssessmentEvent extends Equatable {
  const AssessmentEvent();
}

class OnCognitiveStatusChanged extends AssessmentEvent {

  final String cognition;
  const OnCognitiveStatusChanged(this.cognition);

  @override
  List<Object> get props => [cognition];
}

class OnApplicableMeasureChanged extends AssessmentEvent {

  final String applicableMeasures;

  const OnApplicableMeasureChanged(this.applicableMeasures);

  @override
  List<Object> get props => [applicableMeasures];
}

class OnPatientChanged extends AssessmentEvent {

  final int patientId;
  const OnPatientChanged(this.patientId);

  @override
  List<Object> get props => [patientId];
}

class StartAssessment extends AssessmentEvent{
  const StartAssessment();

  @override
  List<Object> get props => [];
}