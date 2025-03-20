import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getplayingTrendingMovies();
  Future<Either>getMovieTrailer(int movieId);
}


