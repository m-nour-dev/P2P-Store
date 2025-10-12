import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/core/theme/app_theme.dart';
import 'package:p2p_store/features/order/presentation/manager/address_edit_cubit.dart';
import 'package:p2p_store/features/order/presentation/manager/product_cubit.dart';
import 'package:p2p_store/features/order/presentation/pages/checkout_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => AddressEditCubit()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: CheckoutPage(),
      ),
    );
  }
}
