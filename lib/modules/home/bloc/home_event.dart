part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}


class FetchHistory extends HomeEvent {

  const FetchHistory();

  @override
  List<Object> get props => [];
}
