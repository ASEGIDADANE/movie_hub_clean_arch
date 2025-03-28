import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/domain/tv/usecase/get_popular_tv.dart';

import 'package:movie_app/presentation/home/bloc/popular_tv_state.dart';
import 'package:movie_app/service_locator.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvloadingState());

  void getPopularTvMovies() async {
    var returnedData = await locator<GetPopularTvUseCase>().call(null);
    
    return returnedData.fold(
      (error) {
        emit(failureState(message: error));
      },
      (data) {
        emit(PopularTvLoadedState(tv: data));
        

      },
    );
  }
}

