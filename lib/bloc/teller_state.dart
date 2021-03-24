part of 'teller_bloc.dart';

enum ProjectFetchedStatus { initial, success, failure }

class TellerState extends Equatable {
  final ProjectFetchedStatus status;
  final List<Storyteller> storyteller;

  TellerState({
    this.status = ProjectFetchedStatus.initial, 
    this.storyteller = const <Storyteller>[],
    });

  TellerState coppyWith({
    ProjectFetchedStatus status,
    List<Storyteller> storyteller,
  }) {
    return TellerState(
      status: status ?? this.status,
      storyteller: storyteller ?? this.storyteller,
    );
  }

  @override
  List<Object> get props => [status, storyteller];
}
