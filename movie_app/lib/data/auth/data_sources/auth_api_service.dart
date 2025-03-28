


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/model/sigin_req_params.dart';
import 'package:movie_app/data/auth/model/signup_req_params.dart';
import 'package:movie_app/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signUp(SignupReqParams params);
    Future<Either> signin(SigninReqParams params);
  
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signUp(SignupReqParams params) async {
    try{
     
      var response = await locator<DioClient>().post(
        AppUrls.signUp,
        data: params.toMap()
        );
 
      return right(response.data);
      
     

    } on DioException catch(e){
      return left(e.response!.data['message'] ?? 'Unknown Error');
    }
  }
  
  @override
  Future<Either> signin(SigninReqParams params) async {
     try{
      var response = await locator<DioClient>().post(
        AppUrls.signin,
        data: params.toMap()
        );
      return right(response.data);
      
     

    } on DioException catch(e){
      return left(e.response!.data['message'] ?? 'unknown error');
    }
  }
}
