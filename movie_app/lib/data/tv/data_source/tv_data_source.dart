import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class TvService {
  Future<Either>getPopularTv();
  Future<Either> getRecommandtionTvs(int tvId);
  Future<Either> getSimilarTvs(int tvId);
}


class TvServiceImpl extends TvService {
  @override
  Future<Either> getPopularTv() async{
    try{
      var response = await locator<DioClient>().get(
        AppUrls.popularTv,
        
        );
      return right(response.data);
    } on DioException catch(e){
      return left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getRecommandtionTvs(int tvId) async {
      try {
      var response = await locator<DioClient>().get('${AppUrls.tvRecommandtion}/$tvId');
   
      
      return right(response.data);

    } on DioException catch (e) {
      
      return left(e.response!.data['message']);



    }
  }
  
  @override
  Future<Either> getSimilarTvs(int tvId) async {
   try {
      var response = await locator<DioClient>().get('${AppUrls.movieSimilar}/$tvId');
    
      
      return right(response.data);

    } on DioException catch (e) {
      
      return left(e.response!.data['message']);


    }
  }
  
}