import 'package:flutter/material.dart';

class SponsoredAdd extends StatelessWidget {
  const SponsoredAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 203, 212),
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 255, 203, 212), Colors.white]),
          borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 6,
            child: Text(
              'Sponsered',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 25,
            bottom: 25,
            right: 5,
            left: 5,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.asset(
                'assets/images/sponsered_add.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'up to 50% Off',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Icon(Icons.arrow_forward_ios,
                size: 18, color: Colors.grey[600]),
          )
        ],
      ),
    );
  }
}
