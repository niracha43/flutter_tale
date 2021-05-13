part of 'teller_bloc.dart';

enum ProjectFetchedStatus { initial, success, failure }
enum Situation {storyteller, popular, recent}

class TellerState extends Equatable {
  final ProjectFetchedStatus status;
  final List<Storyteller> storyteller;
  final Situation situation;

  TellerState({
    this.status = ProjectFetchedStatus.initial, 
    this.storyteller = const <Storyteller>[],
    this.situation = Situation.storyteller,
    });

  TellerState coppyWith({
    ProjectFetchedStatus? status,
    List<Storyteller>? storyteller,
    Situation? situation,
  }) {
    return TellerState(
      status: status ?? this.status,
      storyteller: storyteller ?? this.storyteller,
      situation: situation?? this.situation,
    );
  }

  @override
  List<Object> get props => [status, storyteller, situation];
}
