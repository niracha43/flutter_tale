import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/video.dart';
import 'package:mobile_project/models/videoList.dart';
import 'package:mobile_project/service/storyteller_bord.dart';

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
  void onTransition(Transition<VideoEvent, VideoState> transition) {
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
          ? state.copyWith(videoList: [])
          : state.copyWith(
              status: ProjectFetchedStatus.success,
              videoList: _videoList,
            );
    }
    if (event is PopularEvent) {
      List<VideoList> _videoList = videopopularLists;

      yield _videoList.isEmpty
          ? state.copyWith(videoList: [])
          : state.copyWith(
              status: ProjectFetchedStatus.success,
              videoList: _videoList,
              situation: Situation.popular,
            );
    }
    if (event is FetchedPlaylist) {
       yield await _mapFetchedToState(event);
    }

  }

  Future<VideoState> _mapFetchedToState(VideoEvent event) async {
    if (event is FetchedPlaylist) {
      try {
        List<VideoList> _videoList =
            await TellerService().getList(event.pathlist);

        return _videoList.isEmpty
            ? state.copyWith(videoList: [])
            : state.copyWith(
                status: ProjectFetchedStatus.success,
                videoList: _videoList,
              );
      } on Exception {
        return state.copyWith(
          status: ProjectFetchedStatus.failure,
          videoList: [],
        );
      }
    }
  }
}
