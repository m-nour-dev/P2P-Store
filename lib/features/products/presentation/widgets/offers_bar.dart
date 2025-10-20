import 'package:flutter/material.dart';

class OffersBar extends StatelessWidget {
  const OffersBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiary,
          borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('assets/images/offers.png'),
              )),
          Positioned(
            right: 16,
            left: 95,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Special Offers',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 32,
            right: 16,
            left: 95,
            bottom: 0,
            child: Text(
              'We make sure you get the offer you need at best prices',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
            ),
          )
        ],
      ),
    );
  }
}
