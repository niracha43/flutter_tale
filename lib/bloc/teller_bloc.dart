import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:meta/meta.dart';
import 'package:mobile_project/models/teller.dart';

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
  void onChange(Change<TellerState> change){
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
    if(event is FetchedEvent){
      List<Storyteller> StoryList = <Storyteller>[];
      Storyteller tell =  Storyteller();
      tell.id = 1;
      tell.stName = "xxxx";
      tell.stChannel = "dddd";
      tell.imageUrl = "sss";
      tell.stColor = "kkkkk";

      StoryList.add(tell);
      yield StoryList.isEmpty
          ? state.coppyWith(storyteller:[])
          : state.coppyWith(
            status:  ProjectFetchedStatus.success,
            storyteller:  StoryList,
          );
    }
  }
}
