

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/model/sigin_req_params.dart';
import 'package:movie_app/data/auth/model/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
 
}