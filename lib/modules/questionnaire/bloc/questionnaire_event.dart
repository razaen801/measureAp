part of 'questionnaire_bloc.dart';

sealed class QuestionnaireEvent extends Equatable {
  const QuestionnaireEvent();
}

class InitializeValue extends QuestionnaireEvent {
  final PatientAssessmentDetail detail;

  const InitializeValue(this.detail);

  @override
  List<Object?> get props => [detail];
}

class OnNext extends QuestionnaireEvent {
  const OnNext();

  @override
  List<Object?> get props => [];
}

class OnPrev extends QuestionnaireEvent {
  const OnPrev();

  @override
  List<Object?> get props => [];
}

class FingersShown extends QuestionnaireEvent {
  final bool isCorrect;

  const FingersShown(this.isCorrect);

  @override
  List<Object?> get props => [isCorrect];
}

class AnswersJillsLife extends QuestionnaireEvent{
  bool? boughtCandy;
  bool? hasDog;
  bool? tookCab;

  AnswersJillsLife({this.boughtCandy, this.hasDog, this.tookCab});

  @override
  List<Object?> get props => [boughtCandy,hasDog,tookCab,];
}

class ReadSentence extends QuestionnaireEvent{

  const ReadSentence();

  @override
  List<Object?> get props => [];
}

class IdentifiesAnimals extends QuestionnaireEvent{
  bool? identifiesChicken;
  bool? identifiesHorse;
  bool? identifiesDog;

  IdentifiesAnimals({this.identifiesChicken, this.identifiesHorse, this.identifiesDog});

  @override
  List<Object?> get props => [identifiesChicken,identifiesHorse,identifiesDog,];
}

class FinishesAssessment extends QuestionnaireEvent{

  const FinishesAssessment();

  @override
  List<Object?> get props => [];
}