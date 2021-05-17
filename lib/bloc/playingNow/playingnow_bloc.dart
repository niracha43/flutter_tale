import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'playingnow_event.dart';
part 'playingnow_state.dart';

class PlayingnowBloc extends Bloc<PlayingnowEvent, PlayingnowState> {
  PlayingnowBloc() : super(PlayingnowInitial());

  @override
  Stream<PlayingnowState> mapEventToState(
    PlayingnowEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
