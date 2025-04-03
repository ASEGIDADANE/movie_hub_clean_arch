import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/domain/movie/usecase/get_recommandation_movie_usecase.dart';

import 'package:movie_app/presentation/watch/bloc/recommandation_state.dart';


import 'package:movie_app/service_locator.dart';

class RecommandationCubit extends Cubit<RecommandationState> {
  RecommandationCubit() : super(RecommandationLoadingState());

  void getRecommandationMovies(int movieId) async {
 
    var returnedData = await locator<GetRecommandationMovieUsecase>().call(movieId);

    
  
    
    return returnedData.fold(
      (error) {
        emit(FaliureState(message: error));
      },
      (data) {
        emit(RecommandationLoadedState(recommandationList: data));
        
        

      },
    );
  }
}


