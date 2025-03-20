import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> playingTrendingMovies();
  Future<Either> getMovieTrailer(int movieId);
}

class MovieServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await locator<DioClient>().get(AppUrls.trendingMovies);
      return right(response.data);
    } on DioException catch (e) {
      return left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> playingTrendingMovies() async {
    try {
      var response = await locator<DioClient>().get(AppUrls.playingMovies);
      return right(response.data);
    } on DioException catch (e) {
      return left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response = await locator<DioClient>().get('${AppUrls.movieTrailer}/$movieId');
      return right(response.data);
    } on DioException catch (e) {
      return left(e.response!.data['message']);
    }
  }
}
