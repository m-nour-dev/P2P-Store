import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.imagePath, required this.categoryLabel});
  final String imagePath;
  final String categoryLabel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover)),
          ),
          SizedBox(width: 5),
          Text(
            categoryLabel,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
