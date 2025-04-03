import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:movie_app/domain/tv/usecase/get_recommanditions_tv.dart';

import 'package:movie_app/presentation/watch/bloc/recommandation_state.dart';


import 'package:movie_app/service_locator.dart';

class RecommandationTvsCubit extends Cubit<RecommandationState> {
  RecommandationTvsCubit() : super(RecommandationLoadingState());

  void getRecommandationTvs(int movieId) async {
 
    var returnedData = await locator<GetRecommanditionsTv>().call(movieId);

    
  
    
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


