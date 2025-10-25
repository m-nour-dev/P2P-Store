import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:p2p_store/features/authentication/presentation/pages/profile_screen.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) {
        return Scaffold(
          body: Center(
            child: IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<AuthCubit>(),
                      child: ProfileScreen(),
                    ),
                  ),
                );
              },
              icon: Icon(Icons.navigate_before),
            ),
          ),
        );
      },
    );
  }
}
