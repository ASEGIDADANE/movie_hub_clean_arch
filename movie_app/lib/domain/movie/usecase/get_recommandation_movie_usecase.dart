import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movie/repositories/movie_repo.dart';

import 'package:movie_app/service_locator.dart';

class GetRecommandationMovieUsecase extends UseCase<Either, int> {
  @override
  Future<Either> call(int params) async{
    


    return await locator<MovieRepository>().getRecommandtionVideo(params);
  }
}
