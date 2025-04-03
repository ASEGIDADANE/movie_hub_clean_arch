import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/repository/tv_repository.dart';
import 'package:movie_app/service_locator.dart';


class GetPopularTvUseCase extends UseCase <Either,int>{
  
  @override
  Future<Either> call(int params ) async {
    return await locator<TvRepository>().getSimilarTvs(params);
  }
  
}