import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/pages/search_page.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.onTertiary,
        gradient: LinearGradient(
            begin: AlignmentGeometry.centerLeft,
            end: AlignmentGeometry.centerRight,
            colors: [
              Colors.amber,
              Theme.of(context).colorScheme.onTertiary,
            ],
            stops: [
              0.0,
              0.40
            ]),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 5,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              child: SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(
                  'assets/images/rewards.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 5,
            //bottom: 32,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Flat and Heels',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Stand a chance to get rewarded',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: Icon(Icons.arrow_forward_outlined),
                    label: const Text('Visit Now'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                              value: context.read<ToggleFavoriteCartCubit>(),
                              child: SearchPage(
                                  selectedCategory:
                                      'womens-shoes')),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      iconAlignment: IconAlignment.end,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
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
