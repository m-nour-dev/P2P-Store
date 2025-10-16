import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/products/presentation/manager/navigation_cubit.dart';
import 'package:p2p_store/features/products/presentation/pages/home_page.dart';
import 'package:p2p_store/features/products/presentation/pages/search_page.dart';
import 'package:p2p_store/features/products/presentation/pages/test_cart_page.dart';
import 'package:p2p_store/features/products/presentation/pages/test_profile_page.dart';
import 'package:p2p_store/features/products/presentation/pages/wishlist_page.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = const [
      HomePage(),
      SearchPage(),
      TestCartPage(),
      TestProfilePage(),
      WishlistPage()
    ];
    final pageConroller = PageController();

    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: PageView(
              controller: pageConroller,
              onPageChanged: (index) =>
                  context.read<NavigationCubit>().changePage(index),
              children: pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: Colors.black,
              unselectedLabelStyle: TextStyle(color: AppColors.primary),
              selectedFontSize: 15,
              unselectedFontSize: 13,
              onTap: (index) {
                pageConroller.jumpToPage(index);
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: currentIndex == 4
                        ? Icon(Icons.person)
                        : Icon(Icons.person_outline),
                    label: 'Profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}
