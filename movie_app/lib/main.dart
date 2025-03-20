import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/theme/app_theme.dart';
import 'package:movie_app/presentation/splash/bloc/splash_cupit.dart';
import 'package:movie_app/presentation/splash/pages/splash.dart';
import 'package:movie_app/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(DevicePreview(
    enabled: !kReleaseMode, // Enable it only in debug mode
    builder: (context) => const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarIconBrightness: Brightness.light,
        // systemNavigationBarColor: Colors.black,
        // systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return BlocProvider(
      create: (context) => SplashCupit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,

        home: const splashScreen(),
      ),
    );
  }
}
