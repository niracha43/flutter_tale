part of 'video_bloc.dart';

@immutable
abstract class VideoEvent {}

class FetchedEvent extends VideoEvent{
  FetchedEvent();

  @override
  List<Object> get props => [];
}

class PopularEvent extends VideoEvent{
  PopularEvent();

  @override
  List<Object> get props => [];
}

class RecentEvent extends VideoEvent{
  RecentEvent();

  @override
  List<Object> get props => [];
}

class AllEvent extends VideoEvent{
  AllEvent();

  @override
  List<Object> get props => [];
}

class FavouritesEvent extends VideoEvent{
  FavouritesEvent();

  @override
  List<Object> get props => [];
}




