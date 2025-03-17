import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecase/get_trending_usecase.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';
import 'package:movie_app/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoveloadingState());

  void getTrendingMovies() async {
    var returnedData = await locator<getTrendingUsecase>().call(null);
    return returnedData.fold(
      (error) {
        emit(failureState(message: error));
      },
      (data) {
        emit(TrendingMoveLoadedState(movies: data));
      },
    );
  }
}
