part of 'history_bloc.dart';

enum HistoryStatus {
  initial,
  inProgress,
  success,
  failed,
}

 class HistoryState extends Equatable {
   HistoryStatus status;
   List<PatientAssessmentDetail>? histories;

   HistoryState({
     this.status = HistoryStatus.initial,
     this.histories,
   });

   HistoryState copyWith({
     HistoryStatus? status,
     List<PatientAssessmentDetail>? histories,
   }) {
     return HistoryState(
       status: status ?? this.status,
       histories: histories ?? this.histories,
     );
   }

   @override
   List<Object?> get props => [
     status,
     histories,
   ];
}

