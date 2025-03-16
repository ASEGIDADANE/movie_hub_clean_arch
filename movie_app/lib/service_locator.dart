
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/data_sources/auth_api_service.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecase/islogged_in.dart';
import 'package:movie_app/domain/auth/usecase/signin.dart';
import 'package:movie_app/domain/auth/usecase/signup.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
 locator.registerSingleton<DioClient>(DioClient());

//  data sources
 locator.registerFactory<AuthApiService>(() => AuthApiServiceImpl());

//  repositories
 locator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());

//  usecases
 locator.registerFactory<signupusecase>(() => signupusecase());
 locator.registerFactory<signinusecase>(() => signinusecase());
 locator.registerFactory<IsLoggedInUseCase>(() => IsLoggedInUseCase());



}