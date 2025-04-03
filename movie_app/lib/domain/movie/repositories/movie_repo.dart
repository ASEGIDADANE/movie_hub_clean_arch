import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getplayingTrendingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommandtionVideo(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  
}


