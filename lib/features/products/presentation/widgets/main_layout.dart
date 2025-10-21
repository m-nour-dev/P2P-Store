import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/presentation/pages/checkout_page.dart';
import 'package:p2p_store/features/products/presentation/manager/navigation_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/pages/home_page.dart';
import 'package:p2p_store/features/products/presentation/pages/search_page.dart';
import 'package:p2p_store/features/products/presentation/pages/test_profile_page.dart';
import 'package:p2p_store/features/products/presentation/pages/wishlist_page.dart';
import 'package:p2p_store/features/products/presentation/widgets/costum_app_bar.dart';
import 'package:p2p_store/features/products/presentation/widgets/costum_bottom_navigation_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = const [
      HomePage(),
      WishlistPage(),
      CheckoutPage(),
      SearchPage(selectedCategory: 'all'),
      TestProfilePage(),
      
    ];
    final pageController = PageController();

    return BlocProvider(
      create: (context) => ToggleFavoriteCartCubit(),
      child: BlocProvider(
        create: (context) => NavigationCubit(),
        child: Builder(
          builder: (context) => Scaffold(
              appBar: CostumAppBar(),
              body: PageView(
                controller: pageController,
                onPageChanged: (index) =>
                    context.read<NavigationCubit>().changePage(index),
                children: pages,
              ),
              bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
                builder: (context, currentIndex) => CostumBottomNavigationBar(
                    pageController: pageController, currentIndex: currentIndex),
              )),
        ),
      ),
    );
  }
}
