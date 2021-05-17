import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_project/models/teller_model.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(PlaylistInitial());

  @override
  Stream<PlaylistState> mapEventToState(
    PlaylistEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }

  // @override
  // Stream<PlaylistEvent> mapEventToState(
  //   PlaylistEvent event,
  // ) async* {
  //   if (event is FetchedTellerEvent) {
  //     List<TellerModel> _storyList = tellerLists;

  //     yield _storyList.isEmpty
  //         ? state.coppyWith(storyteller: [])
  //         : state.coppyWith(
  //             status: ProjectFetchedStatus.success,
  //             storyteller: _storyList,
  //           );
  //   }
  //}
}
