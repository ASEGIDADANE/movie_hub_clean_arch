import 'package:movie_app/domain/movie/entities/movie_entities.dart';

abstract class NowPlayingState {}

class NowPlayingMoveloadingState extends NowPlayingState {}

class NowPlayingMoveLoadedState extends NowPlayingState {
  final List<MovieEntity> movies;

  NowPlayingMoveLoadedState({required this.movies});
}

class failureState extends NowPlayingState {
  final String message;

  failureState({required this.message});
} 




