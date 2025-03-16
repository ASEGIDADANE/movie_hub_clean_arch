import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/auth/model/signup_req_params.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

class signupusecase extends UseCase <Either, SignupReqParams>{
  
  @override
  Future<Either> call(SignupReqParams? params) async {
    return await locator<AuthRepository>().signUp(params!);
  }
  
}