part of 'video_bloc.dart';

enum ProjectFetchedStatus { initial, success, failure }
enum Situation {storyteller, popular, recent}

class VideoState extends Equatable {
  final ProjectFetchedStatus status;
  final List<VideoList> videoList;
  final Situation situation;

  VideoState({
    this.status = ProjectFetchedStatus.initial, 
    this.videoList = const <VideoList>[],
    this.situation = Situation.storyteller,
    });

  VideoState coppyWith({
    ProjectFetchedStatus? status,
    List<VideoList>? videoList,
    Situation? situation,
  }) {
    return VideoState(
      status: status ?? this.status,
      videoList: videoList ?? this.videoList,
      situation: situation?? this.situation,
    );
  }

  @override
  List<Object> get props => [status, videoList, situation];
}

