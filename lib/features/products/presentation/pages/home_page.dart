import 'package:flutter/material.dart';
import 'package:p2p_store/core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [Container(color: AppColors.primary)]),
      ),
    );
  }
}
