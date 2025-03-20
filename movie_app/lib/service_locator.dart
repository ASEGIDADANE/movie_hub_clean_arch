
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/data_sources/auth_api_service.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/movie/data_source/movie_api_service.dart';
import 'package:movie_app/data/movie/repositories/movie_repo_impl.dart';
import 'package:movie_app/data/tv/data_source/tv_data_source.dart';
import 'package:movie_app/data/tv/repository/tv_repo_impl.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecase/islogged_in.dart';
import 'package:movie_app/domain/auth/usecase/signin.dart';
import 'package:movie_app/domain/auth/usecase/signup.dart';
import 'package:movie_app/domain/movie/repositories/movie_repo.dart';
import 'package:movie_app/domain/movie/usecase/get_movie_trailerUsecase.dart';
import 'package:movie_app/domain/movie/usecase/get_playing_trending_usecase.dart';
import 'package:movie_app/domain/movie/usecase/get_trending_usecase.dart';
import 'package:movie_app/domain/tv/repository/tv_repository.dart';
import 'package:movie_app/domain/tv/usecase/get_popular_tv.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
 locator.registerSingleton<DioClient>(DioClient());

//  data sources
 locator.registerFactory<AuthApiService>(() => AuthApiServiceImpl());
 locator.registerFactory<MovieService>(() => MovieServiceImpl());
 locator.registerFactory<TvService>(() => TvServiceImpl());


//  repositories
 locator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
 locator.registerFactory<MovieRepository>(() => MovieRepositoryImpl());
 locator.registerFactory<TvRepository>(() => TvRepositoryImpl());



//  usecases
 locator.registerFactory<signupusecase>(() => signupusecase());
 locator.registerFactory<signinusecase>(() => signinusecase());
 locator.registerFactory<IsLoggedInUseCase>(() => IsLoggedInUseCase());
 locator.registerFactory<getTrendingUsecase>(() => getTrendingUsecase());
 locator.registerFactory<GetPlayingTrendingUsecase>(() => GetPlayingTrendingUsecase());
 locator.registerFactory<GetPopularTvUseCase>(() => GetPopularTvUseCase());
 locator.registerFactory<GetTrailerMovieUsecase>(() => GetTrailerMovieUsecase());







}