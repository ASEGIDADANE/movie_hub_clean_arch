import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecase/get_similar_movies_usecase.dart';
import 'package:movie_app/presentation/watch/bloc/similar_movies_state.dart';




import 'package:movie_app/service_locator.dart';

class SimilarTvsCubit extends Cubit<SimilarState> {
  SimilarTvsCubit() : super(SimilarLoadingState());

  void getSimilarTvs(int movieId) async {
 
    var returnedData = await locator<GetSimilarMoviesUsecase>().call(movieId);

    
  
    
    return returnedData.fold(
      (error) {
        emit(FaliureState(message: error));
      },
      (data) {
        emit(SimilarLoadedState(SimilarList: data));
        
        

      },
    );
  }
}


