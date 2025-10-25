import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/pages/search_page.dart';

class SummerOffersCard extends StatelessWidget {
  const SummerOffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 248, 215, 180),
          //image: DecorationImage(
          //image: AssetImage('assets/images/summer_offers.png'),
          //fit: BoxFit.contain)
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/summer_offers.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onTertiary,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(12),
                        bottomStart: Radius.circular(12))),
                height: 50,
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "New Arrivals ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "Summer’ 25 Collections",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                    value:
                                        context.read<ToggleFavoriteCartCubit>(),
                                    child: SearchPage(
                                        selectedCategory:
                                            'sunglasses')),
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_forward_outlined),
                          label: const Text('View all'),
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
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
