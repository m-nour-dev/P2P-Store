import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/products/presentation/manager/navigation_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/theme_cubit.dart';

class CostumBottomNavigationBar extends StatelessWidget {
  const CostumBottomNavigationBar(
      {super.key, required this.pageController, required this.currentIndex});
  final PageController pageController;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      backgroundColor: context.read<ThemeCubit>().state.isDarkToggled
          ? const Color.fromARGB(255, 21, 18, 33)
          : Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: context.read<ThemeCubit>().state.isDarkToggled
          ? Colors.white
          : Colors.black,
      unselectedLabelStyle: TextStyle(color: AppColors.primary),
      selectedFontSize: 15,
      unselectedFontSize: 13,
      onTap: (index) {
        pageController.jumpToPage(index);
        context.read<NavigationCubit>().changePage(index);
      },
      items: [
        BottomNavigationBarItem(
            icon: currentIndex == 0
                ? Icon(Icons.home)
                : Icon(Icons.home_outlined),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: currentIndex == 1
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            label: 'Whishlist'),
        BottomNavigationBarItem(
            icon: currentIndex == 2
                ? Icon(Icons.shopping_cart)
                : Icon(Icons.shopping_cart_outlined),
            label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: currentIndex == 4
                ? Icon(Icons.person)
                : Icon(Icons.person_outline),
            label: 'Profile'),
      ],
    );
  }
}
