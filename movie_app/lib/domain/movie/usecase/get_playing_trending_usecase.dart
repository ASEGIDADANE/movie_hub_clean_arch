import 'package:dartz/dartz.dart';

import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movie/repositories/movie_repo.dart';


import 'package:movie_app/service_locator.dart';

class GetPlayingTrendingUsecase extends UseCase <Either,dynamic>{
  
  @override
  Future<Either> call(params ) async {
    return await locator<MovieRepository>().getplayingTrendingMovies();
  }
  
}