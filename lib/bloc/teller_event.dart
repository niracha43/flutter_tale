part of 'teller_bloc.dart';

@immutable
abstract class TellerEvent {}

class FetchedEvent extends TellerEvent{
  FetchedEvent();

  @override
  List<Object> get props => [];
}

class PopularEvent extends TellerEvent{
  PopularEvent();

  @override
  List<Object> get props => [];
}

class RecentEvent extends TellerEvent{
  RecentEvent();

  @override
  List<Object> get props => [];
}


