part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  inProgress,
  success,
  failed,
}

class HomeState extends Equatable {
  HomeStatus homeStatus;
  List<PatientAssessmentDetail>? histories;

  HomeState({
    this.homeStatus = HomeStatus.initial,
    this.histories,
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<PatientAssessmentDetail>? histories,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      histories: histories ?? this.histories,
    );
  }

  @override
  List<Object?> get props => [
        homeStatus,
        histories,
      ];
}
