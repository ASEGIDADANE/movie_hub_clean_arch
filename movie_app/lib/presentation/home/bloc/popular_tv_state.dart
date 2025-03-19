
import 'package:movie_app/domain/tv/entities/tv_entities.dart';

abstract class PopularTvState {}

class PopularTvloadingState extends PopularTvState {}

class PopularTvLoadedState extends PopularTvState {
  final List<TVEntity> tv;

  PopularTvLoadedState({required this.tv});
}

class failureState extends PopularTvState {
  final String message;

  failureState({required this.message});
} 




