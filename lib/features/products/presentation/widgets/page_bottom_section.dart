import 'package:flutter/material.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/products/presentation/widgets/bottom_bars.dart';
import 'package:p2p_store/features/products/presentation/widgets/payment_logo_bar.dart';
import 'package:p2p_store/features/products/presentation/widgets/social_media_links.dart';

class PageBottomSection extends StatelessWidget {
  const PageBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Divider(
            thickness: 2,
            color: AppColors.primary,
          ),
          SizedBox(
            height: 20,
          ),
          BottomBars(
              path: 'assets/images/bar3.png',
              label1: 'At Your Door Tomorrow',
              label2:
                  'Get your needs tomorrow with At Your Door Tomorrow service!'),
          SizedBox(height: 5),
          BottomBars(
              path: 'assets/images/bar4.png',
              label1: 'One-Click Secure Shopping',
              label2: 'Save your payment and address info, and shop securely.'),
          SizedBox(height: 5),
          BottomBars(
              path: 'assets/images/bar2.png',
              label1: 'Mobile Access',
              label2: 'Enjoy secure shopping from wherever you wish.'),
          SizedBox(height: 5),
          BottomBars(
              path: 'assets/images/bar1.png',
              label1: 'Return at Your Door',
              label2:
                  'Returning the product you bought has never been this easy.'),
          SizedBox(height: 25),
          SocialMediaLinks(),
          SizedBox(height: 170),
          PaymentLogoBar(),
        ],
      ),
    );
  }
}
