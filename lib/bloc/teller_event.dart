part of 'teller_bloc.dart';

@immutable
abstract class TellerEvent {}

class FetchedEvent extends TellerEvent{
  FetchedEvent();

  @override
  List<Object> get props => [];
}


