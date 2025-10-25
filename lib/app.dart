import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/core/theme/app_theme.dart';
import 'package:p2p_store/features/products/presentation/manager/theme_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/theme_state.dart';
import 'package:p2p_store/features/products/presentation/widgets/main_layout.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => MaterialApp(
          
          title: AppConstants.appName,
          theme: context.read<ThemeCubit>().state.isDarkToggled
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: MainLayout(),
        ),
      ),
    );
  }
}

