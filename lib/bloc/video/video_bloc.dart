import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/video.dart';
import 'package:mobile_project/models/videoList.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoState());
    @override
  void onEvent(VideoEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onChange(Change<VideoState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<VideoEvent,  VideoState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if (event is FetchedEvent) {
      List<VideoList> _videoList = videoList;

      yield _videoList.isEmpty
          ? state.coppyWith(storyteller: [])
          : state.coppyWith(
              status: ProjectFetchedStatus.success,
              storyteller: _videoList,
            );
    }
    if (event is PopularEvent) {
      List<VideoList> _videoList = videopopularLists;

      yield _videoList.isEmpty
          ? state.coppyWith(storyteller: [])
          : state.coppyWith(
              status: ProjectFetchedStatus.success,
              storyteller: _videoList,
              situation: Situation.popular,
            );
    }
    if (event is RecentEvent) {
      List<VideoList> _videoList = videorecentLists;

      yield _videoList.isEmpty
          ? state.coppyWith(storyteller: [])
          : state.coppyWith(
              status: ProjectFetchedStatus.success,
              storyteller: _videoList,
              situation: Situation.recent,
            );
    }
    // TODO: implement mapEventToState
  }
}
