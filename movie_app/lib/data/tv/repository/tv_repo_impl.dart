import 'package:dartz/dartz.dart';

import 'package:movie_app/common/helper/mapper/tv_mapper.dart';

import 'package:movie_app/data/tv/data_source/tv_data_source.dart';

import 'package:movie_app/data/tv/model/tv_model.dart';

import 'package:movie_app/domain/tv/repository/tv_repository.dart';
import 'package:movie_app/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv() async {
     var returnData = await locator<TvService>().getPopularTv();

    return returnData.fold(
      (error) {
        return left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((items) => TvMapper.toEntity(TVModel.fromJson(items)) ).toList();
        return right(movies);
        // this return trending movies

  }
    );
  }
  
  @override
  Future<Either> getRecommandtionTvs(int tvId) async {
    var returnData = await locator<TvService>().getRecommandtionTvs(tvId);
    print( "Recommandation TV Data: $returnData"); // Debugging line to check the return data

    return returnData.fold(
      (error) {
        return left(error);
      },
      (data) {
        var movies =
            List.from(data['content'])
                .map(
                  (items) => TvMapper.toEntity(TVModel.fromJson(items)),
                )
                .toList();
        return right(movies);
        
      },
    );
  }
  
  @override
  Future<Either> getSimilarTvs(int tvId) async{
    var returnData = await locator<TvService>().getSimilarTvs(
      tvId,
    );
   
    return returnData.fold(
      (error) {
        return left(error);
      },
      (data) {
       
         var movies =
            List.from(data['content'])
                .map(
                  (items) => TvMapper.toEntity(TVModel.fromJson(items)),
                )
                .toList();
        return right(movies);

        
      },
    );
  }
}