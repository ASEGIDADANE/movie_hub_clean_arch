import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/data/auth/model/sigin_req_params.dart';
import 'package:movie_app/domain/auth/usecase/signin.dart';

import 'package:movie_app/presentation/auth/pages/signup.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 60),
            _signinButton(context),
            const SizedBox(height: 20),
            _signupText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: passwordController,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed:
          () async => locator<signinusecase>().call(
            SigninReqParams(
              email: emailController.text,
              password: passwordController.text,
            ),
          ),

      onSuccess: () {
        AppNavigator.pushReplacement(context, const HomePage());
      },
      onFailure: (error) {
        print('this is check up');
        print(error);
        DisplayMessage.errorMessage(error, context);
        print("what is error");
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Don't you have account?"),
          TextSpan(
            text: ' Sign Up',
            style: const TextStyle(color: Colors.blue),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SignupPage());
                  },
          ),
        ],
      ),
    );
  }
}
