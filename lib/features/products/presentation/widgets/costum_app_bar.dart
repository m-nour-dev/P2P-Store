import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/products/presentation/manager/theme_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/theme_state.dart';

class CostumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CostumAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.menu),
        color: AppColors.primary,
      ),
      centerTitle: true,
      title: Image.asset(
        'assets/images/P2P_logo.png',
        height: 90,
      ),
      actions: [
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (BuildContext context, state) {
            return IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().changeTheme();
                },
                icon: state.isDarkToggled
                    ? Icon(Icons.sunny, color: Colors.amber)
                    : Icon(Icons.nightlight_outlined, color: Colors.blue));
          },
        )
      ],
    );
  }

  // لتحديد ارتفاع الAppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
