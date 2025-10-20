import 'package:flutter/material.dart';

class PaymentLogoBar extends StatelessWidget {
  final List<String> logoPaths = const [
    'assets/images/master-card.png',
    'assets/images/axess.png',
    'assets/images/paraf.png',
    'assets/images/visa.png',
    'assets/images/troy.png',
  ];

  const PaymentLogoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAEBEA),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: logoPaths.map((path) {
            return Image.asset(
              path,
              height: 25,
            );
          }).toList(),
        ),
      ),
    );
  }
}
