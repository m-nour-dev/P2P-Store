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
              label: 'all',
              categoryLabel: 'all',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/beauty.jpg',
              label: 'beauty',
              categoryLabel: 'beauty',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/mens-shirts.jpeg',
              label: 'mens shirts',
              categoryLabel: 'mens-shirts',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/laptops.jpeg',
              label: 'laptops',
              categoryLabel: 'laptops',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/home-decoration.jpeg',
              label: 'home',
              categoryLabel: 'home-decoration',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/womens-jewellery.jpeg',
              label: 'jewellery',
              categoryLabel: 'womens-jewellery',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/mens-watches.jpeg',
              label: 'm.watches',
              categoryLabel: 'mens-watches',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/fragrances.jpeg',
              categoryLabel: 'fragrances',
              label: 'fragrances',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/furniture.jpeg',
              categoryLabel: 'furniture',
              label: 'furniture',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/groceries.jpg',
              categoryLabel: 'groceries',
              label: 'groceries',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/kitchen-accessories.jpg',
              categoryLabel: 'kitchen-accessories',
              label: 'kitchen',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/mens-shoes.webp',
              categoryLabel: 'mens-shoes',
              label: 'm.shoes',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/mobile-accessories.jpeg',
              categoryLabel: 'mobile-accessories',
              label: 'mobile acc.',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/motorcycle.jpeg',
              categoryLabel: 'motorcycle',
              label: 'motorcycle',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/skin-care.jpeg',
              categoryLabel: 'skin care',
              label: 'skin care',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/smartphones.webp',
              categoryLabel: 'smartphones',
              label: 'smartphones',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/sports-accessories.jpeg',
              categoryLabel: 'sports-accessories',
              label: 'sports',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/sunglasses.webp',
              categoryLabel: 'sunglasses',
              label: 'sunglasses',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/tablets.jpeg',
              categoryLabel: 'tablets',
              label: 'tablets',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/vehicle.jpeg',
              categoryLabel: 'vehicle',
              label: 'vehicle',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/womens-bags.jpg',
              categoryLabel: 'womens-bags',
              label: 'w.bags',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/womens-dresses.jpg',
              categoryLabel: 'womens-dresses',
              label: 'w.dresses',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/womens-shoes.jpeg',
              categoryLabel: 'womens-shoes',
              label: 'w.shoes',
            ),
            CategoryItem(
              imagePath: 'assets/images/categories/womens-watches.jpeg',
              categoryLabel: 'womens-watches',
              label: 'w.watches',
            ),
          ],
        ),
      ),
    );
  }
}
