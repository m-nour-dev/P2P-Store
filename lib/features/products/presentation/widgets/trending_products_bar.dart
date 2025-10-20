import 'package:flutter/material.dart';
import 'package:p2p_store/core/theme/app_colors.dart';

class TrendingProductsBar extends StatelessWidget {
  const TrendingProductsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.primary),
      child: Stack(children: [
        Positioned(
          right: 15,
          top: 10,
          bottom: 10,
          child: ElevatedButton.icon(
            onPressed: () {},
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
                side: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
            top: 6,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending Products ',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    Text(
                      'Last Date 29/02/22',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ))
      ]),
    );
  }
}
