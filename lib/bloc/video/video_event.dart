part of 'video_bloc.dart';

@immutable
abstract class VideoEvent {}

class FetchedEvent extends VideoEvent {
  FetchedEvent();

  @override
  List<Object> get props => [];
}

class FetchedPlaylist extends VideoEvent {
  FetchedPlaylist({this.pathlist});
  final String pathlist;

  @override
  List<Object> get props => [pathlist];
}

class PopularEvent extends VideoEvent {
  PopularEvent();

  @override
  List<Object> get props => [];
}

class SearchEvent extends VideoEvent {
  SearchEvent({this.searchText});
  final String searchText;

  @override
  List<Object> get props => [];
}

// class RecentEvent extends VideoEvent{
//   RecentEvent();

//   @override
//   List<Object> get props => [];
// }

class AllEvent extends VideoEvent {
  AllEvent();

  @override
  List<Object> get props => [];
}
