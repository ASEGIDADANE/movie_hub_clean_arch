import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecase/get_playing_trending_usecase.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_state.dart';


import 'package:movie_app/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoveloadingState());

  void getNowPlayingMovies() async {
    var returnedData = await locator<GetPlayingTrendingUsecase>().call(null);
    
    return returnedData.fold(
      (error) {
        emit(failureState(message: error));
      },
      (data) {
        emit(NowPlayingMoveLoadedState(movies: data));
        

      },
    );
  }
}


