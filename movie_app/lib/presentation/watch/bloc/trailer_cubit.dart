import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entities/trailer_enities.dart';
import 'package:movie_app/domain/movie/usecase/get_movie_trailerUsecase.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoadingState());

  void getMovieTrailer(int movieId) async {
    try {
      var returnedData = await locator<GetTrailerMovieUsecase>().call(movieId);
     


      returnedData.fold(
        (error) {
        
          emit(FailureState(message: error));
        },
        (data) async {
          List<TrailerEntity>trailerEntity = data;
      
          
           TrailerEntity trailer = trailerEntity.first;
          if (trailer.key == null) {
            emit(FailureState(message: "Trailer key is null"));
            return;
          }
          

          YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId: trailer.key!,

            flags: const YoutubePlayerFlags(
              autoPlay: true),
          );
        
         

          emit(TrailerLoadedState(youtubePlayerController: controller));
          

          
        },
      );
    } catch (e) {
    
      emit(FailureState(message: e.toString()));
    }
  }
}
