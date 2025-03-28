

import 'package:movie_app/data/movie/model/movie_model.dart';
import 'package:movie_app/domain/movie/entities/movie_entities.dart';

class MovieMapper {

  static MovieEntity toEntity(MovieModel movie) {
   
    return MovieEntity(
      backdropPath: movie.backdropPath, 
      id: movie.id, 
      title: movie.title, 
      originalTitle: movie.originalTitle, 
      overview: movie.overview, 
      posterPath: movie.posterPath, 
      mediaType: movie.mediaType, 
      adult: movie.adult, 
      originalLanguage: movie.originalLanguage, 
      genreIds: movie.genreIds, 
      popularity: movie.popularity, 
      releaseDate: movie.releaseDate, 
      video: movie.video, 
      voteAverage: movie.voteAverage, 
      voteCount: movie.voteCount
    );
  }
}