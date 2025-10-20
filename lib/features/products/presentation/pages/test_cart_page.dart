import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_state.dart';

class TestCartPage extends StatelessWidget {
  const TestCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<ToggleFavoriteCartCubit, ToggleFavoriteCartState>(
        builder: (context, state) => Text(
          state.cartProducts[1].title,
          style: TextStyle(color: Colors.black),
        ),
      )),
    );
  }
}
