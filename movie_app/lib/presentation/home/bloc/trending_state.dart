import 'package:movie_app/domain/movie/entities/movie_entities.dart';

abstract class TrendingState {}

class TrendingMoveloadingState extends TrendingState {}

class TrendingMoveLoadedState extends TrendingState {
  final List<MovieEntity> movies;

  TrendingMoveLoadedState({required this.movies});
}

class failureState extends TrendingState {
  final String message;

  failureState({required this.message});
} 

