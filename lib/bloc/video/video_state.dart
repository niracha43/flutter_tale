part of 'video_bloc.dart';

enum VideoStateStatus { initial, success, failure }
enum Situation { storyteller, popular, all }

class VideoState extends Equatable {
  final VideoStateStatus status;
  final List<VideoList> videoList;
  final Situation situation;

  VideoState({
    this.status = VideoStateStatus.initial,
    this.videoList = const <VideoList>[],
    this.situation = Situation.storyteller,
  });

  VideoState copyWith({
    VideoStateStatus status,
    List<VideoList> videoList,
    Situation situation,
  }) {
    return VideoState(
      status: status ?? this.status,
      videoList: videoList ?? this.videoList,
      situation: situation ?? this.situation,
    );
  }

  @override
  List<Object> get props => [status, videoList, situation];
}
