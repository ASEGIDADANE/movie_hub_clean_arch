import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/data_sources/auth_api_service.dart';
import 'package:movie_app/data/auth/model/sigin_req_params.dart';
import 'package:movie_app/data/auth/model/signup_req_params.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(SignupReqParams params) async {
    print(params.toMap());
    var data = await locator<AuthApiService>().signUp(params);
    print(data);
    return data.fold(
      (error) {
        return left(error);
      },
      (data) async {
        final SharedPreferences sharedpreferences =
            await SharedPreferences.getInstance();
        sharedpreferences.setString('token', data['token']);
        return right(data);
      },
    );
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await locator<AuthApiService>().signin(params);
    print(data);
    print('this is data');
    return data.fold(
      (error) {
        return left(error);
      },
      (data) async {
        final SharedPreferences sharedpreferences =
            await SharedPreferences.getInstance();
        sharedpreferences.setString('token', data['token']);
        return right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedpreferences =
        await SharedPreferences.getInstance();
    final token = sharedpreferences.getString('token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
}
