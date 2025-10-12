import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/core/theme/app_theme.dart';
import 'package:p2p_store/features/order/presentation/manager/address_edit_cubit.dart';
import 'package:p2p_store/features/order/presentation/pages/order_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressEditCubit(),
      child: MaterialApp(
        title: AppConstants.appName,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: OrderPage(),
      ),
    );
  }
}
