import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either> getPopularTv();
  Future<Either> getRecommandtionTvs(int movieId);
  Future<Either> getSimilarTvs(int movieId);

}