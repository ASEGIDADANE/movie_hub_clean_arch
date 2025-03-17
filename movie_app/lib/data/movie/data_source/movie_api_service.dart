import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
}

class MovieServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try{
      var response = await locator<DioClient>().get(
        AppUrls.trendingMovies,
        
        );
      return right(response.data);
      
     

    } on DioException catch(e){
      return left(e.response!.data['message']);
    }
  }
}