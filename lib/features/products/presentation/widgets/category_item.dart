import 'package:flutter/material.dart';
import 'package:p2p_store/features/products/presentation/pages/search_page.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.imagePath,
      required this.categoryLabel,
      required this.label});
  final String imagePath;
  final String categoryLabel;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SearchPage(
                selectedCategory: categoryLabel), // ✅ تمرير اسم الكاتيجوري
          ),
        );
      },
      child: Padding(
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
              label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
