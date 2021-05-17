part of 'playlist_bloc.dart';

abstract class PlaylistState extends Equatable {
  const PlaylistState();
  
  @override
  List<Object> get props => [];
}

class PlaylistInitial extends PlaylistState {}
