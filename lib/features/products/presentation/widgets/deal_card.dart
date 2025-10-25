import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/pages/search_page.dart';

class DealCard extends StatelessWidget {
  const DealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 255, 153, 170),
        // gradient: LinearGradient(colors: [
        //   Color.fromARGB(255, 255, 143, 160),
        //   Color.fromARGB(255, 255, 153, 170).withAlpha(100)
        // ]),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              child: Image.asset(
                'assets/images/deals_removed_bg.png',
                fit: BoxFit.cover,
                width: 175,
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: -5,
            //bottom: 32,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '30% OFF',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'On all fashion items',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: Icon(Icons.arrow_forward_outlined),
                    label: const Text('Shop Now'),
                    onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: context.read<ToggleFavoriteCartCubit>(),
                child: SearchPage(
                    selectedCategory:
                        'mens-shirts')), 
          ),
        );},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 153, 170),
                      foregroundColor: Colors.white,
                      iconAlignment: IconAlignment.end,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
