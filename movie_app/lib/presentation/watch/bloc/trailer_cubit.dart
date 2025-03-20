
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/core/entities/trailer_enities.dart';
import 'package:movie_app/domain/movie/usecase/get_movie_trailerUsecase.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app/service_locator.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoadingState());

  void getMovieTrailer(int movieId) async {
    var returnedData = await locator<GetTrailerMovieUsecase>().call(movieId);

    returnedData.fold(
      (error) {
        emit(FailureState(message: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );

        emit(TrailerLoadedState(youtubePlayerController: controller));
      },
    );
  }
}
