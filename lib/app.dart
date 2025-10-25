import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/core/theme/app_theme.dart';
import 'package:p2p_store/features/authentication/presentation/pages/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Figma tasarım boyutu
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: AppConstants.appName,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}


