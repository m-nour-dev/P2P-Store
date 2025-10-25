import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';
import 'package:p2p_store/features/products/data/remote/product_remote_data_source.dart';
import 'package:p2p_store/features/products/presentation/widgets/product_card.dart';

class ProductListHorizontal extends StatelessWidget {
  ProductListHorizontal({super.key, required this.catLabel});
  final productDataSource = ProductRemoteDataSource();
  final String catLabel;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductListModel>(
      future: productDataSource.getProductsByCategory(catLabel),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.products.isEmpty) {
          return const Center(child: Text('No products found'));
        }

        final products = snapshot.data!.products;

        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: true,
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
          child: SizedBox(
            height: 310,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCard(product: product);
              },
            ),
          ),
        );
      },
    );
  }
}
