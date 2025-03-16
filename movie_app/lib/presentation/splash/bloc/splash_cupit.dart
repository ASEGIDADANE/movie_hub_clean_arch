
import 'package:movie_app/domain/auth/usecase/islogged_in.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/service_locator.dart';

class SplashCupit extends Cubit<SplashState> {

  SplashCupit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));

    var isLoggedIn = await locator<IsLoggedInUseCase>().call(null);
    if ( isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
