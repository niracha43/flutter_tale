import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_project/models/teller.dart';
import 'package:mobile_project/models/tellerList.dart';

part 'teller_event.dart';
part 'teller_state.dart';

class TellerBloc extends Bloc<TellerEvent, TellerState> {
  TellerBloc() : super(TellerState());

  @override
  void onEvent(TellerEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onChange(Change<TellerState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<TellerEvent, TellerState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  Stream<TellerState> mapEventToState(
    TellerEvent event,
  ) async* {
    if (event is FetchedTellerEvent) {
      List<Storyteller> _storyList = tellerLists;

      yield _storyList.isEmpty
          ? state.copyWith(storyteller: [])
          : state.copyWith(
              status: ProjectFetchedStatus.success,
              storyteller: _storyList,
            );
    }
    // if (event is PopularEvent) {
    //   List<Storyteller> _storyList = popularLists;

    //   yield _storyList.isEmpty
    //       ? state.coppyWith(storyteller: [])
    //       : state.coppyWith(
    //           status: ProjectFetchedStatus.success,
    //           storyteller: _storyList,
    //           situation: Situation.popular,
    //         );
    // }
    // if (event is RecentEvent) {
    //   List<Storyteller> _storyList = recentLists;

    //   yield _storyList.isEmpty
    //       ? state.coppyWith(storyteller: [])
    //       : state.coppyWith(
    //           status: ProjectFetchedStatus.success,
    //           storyteller: _storyList,
    //           situation: Situation.recent,
    //         );
    // }
  }
}
