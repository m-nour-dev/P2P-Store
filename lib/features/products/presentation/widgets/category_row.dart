import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:p2p_store/features/products/presentation/widgets/category_item.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: true,
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryItem(
                imagePath: 'assets/images/categories/all.jpg',
                categoryLabel: 'all'),
            CategoryItem(
                imagePath: 'assets/images/categories/beauty.jpg',
                categoryLabel: 'beauty'),
            CategoryItem(
                imagePath: 'assets/images/categories/mens-shirts.jpeg',
                categoryLabel: 'mens shirts'),
            CategoryItem(
                imagePath: 'assets/images/categories/laptops.jpeg',
                categoryLabel: 'laptops'),
            CategoryItem(
                imagePath: 'assets/images/categories/home-decoration.jpeg',
                categoryLabel: 'home'),
            CategoryItem(
                imagePath: 'assets/images/categories/womens-jewellery.jpeg',
                categoryLabel: 'jewellery'),
            CategoryItem(
                imagePath: 'assets/images/categories/mens-watches.jpeg',
                categoryLabel: 'm.watches'),
            CategoryItem(
                imagePath: 'assets/images/categories/fragrances.jpeg',
                categoryLabel: 'fragrances'),
            CategoryItem(
                imagePath: 'assets/images/categories/furniture.jpeg',
                categoryLabel: 'furniture'),
            CategoryItem(
                imagePath: 'assets/images/categories/groceries.jpg',
                categoryLabel: 'groceries'),
            CategoryItem(
                imagePath: 'assets/images/categories/kitchen-accessories.jpg',
                categoryLabel: 'kitchen'),
            CategoryItem(
                imagePath: 'assets/images/categories/mens-shoes.webp',
                categoryLabel: 'm.shoes'),
            CategoryItem(
                imagePath: 'assets/images/categories/mobile-accessories.jpeg',
                categoryLabel: 'mobile acc.'),
            CategoryItem(
                imagePath: 'assets/images/categories/motorcycle.jpeg',
                categoryLabel: 'motorcycle'),
            CategoryItem(
                imagePath: 'assets/images/categories/skin-care.jpeg',
                categoryLabel: 'skin care'),
            CategoryItem(
                imagePath: 'assets/images/categories/smartphones.webp',
                categoryLabel: 'smartphones'),
            CategoryItem(
                imagePath: 'assets/images/categories/sports-accessories.jpeg',
                categoryLabel: 'sports'),
            CategoryItem(
                imagePath: 'assets/images/categories/sunglasses.webp',
                categoryLabel: 'sunglasses'),
            CategoryItem(
                imagePath: 'assets/images/categories/tablets.jpeg',
                categoryLabel: 'tablets'),
            CategoryItem(
                imagePath: 'assets/images/categories/vehicle.jpeg',
                categoryLabel: 'vehicle'),
            CategoryItem(
                imagePath: 'assets/images/categories/womens-bags.jpg',
                categoryLabel: 'w.bags'),
            CategoryItem(
                imagePath: 'assets/images/categories/womens-dresses.jpg',
                categoryLabel: 'w.dresses'),
            CategoryItem(
                imagePath: 'assets/images/categories/womens-shoes.jpeg',
                categoryLabel: 'w.shoes'),
            CategoryItem(
                imagePath: 'assets/images/categories/womens-watches.jpeg',
                categoryLabel: 'w.watches'),
          ],
        ),
      ),
    );
  }
}
