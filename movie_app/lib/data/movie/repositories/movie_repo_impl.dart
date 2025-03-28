import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_app/core/model/movie_trailer_model.dart';
import 'package:movie_app/data/movie/data_source/movie_api_service.dart';
import 'package:movie_app/data/movie/model/movie_model.dart';
import 'package:movie_app/domain/movie/repositories/movie_repo.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async{
    var returnData = await locator<MovieService>().getTrendingMovies();

    return returnData.fold(
      (error) {
        return left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((items) => MovieMapper.toEntity(MovieModel.fromJson(items)) ).toList();
        return right(movies);
        // this return trending movies

          
      },
    );
  }
  
  @override
  Future<Either> getplayingTrendingMovies() async{
     var returnData = await locator<MovieService>().playingTrendingMovies();

    return returnData.fold(
      (error) {
        return left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((items) => MovieMapper.toEntity(MovieModel.fromJson(items)) ).toList();
        return right(movies);
        // this return trending movies

          
      },
    );
  }
  
  @override
  Future<Either> getMovieTrailer(int movieId) async{
    var returnData = await locator<MovieService>().getMovieTrailer(movieId);
   

    return returnData.fold(
      (error) {
        
        return left(error);
      },
      (data) {
        // var movies = List.from(data['content']).map((items) => TrailerMapper.toEntity(TrailerModel.fromJson(items)) ).toList();
        // var movies = TrailerMapper.toEntity(TrailerModel.fromJson(data));

       
        // return right(movies);
        // this return trending movies
         // Extract the 'content' array from the JSON response
      var content = data['content'] as List;
      

      // Map each item in the 'content' array to a TrailerModel
      var trailers = content.map((item) {
        
        return TrailerMapper.toEntity(TrailerModel.fromJson(item));
      }).toList();

      
      return right(trailers);
        

          
      },
    );
  }
  

 
}