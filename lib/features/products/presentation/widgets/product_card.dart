import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/pages/product_details_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    bool isFav = context.read<ToggleFavoriteCartCubit>().isFavorite(product);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: context.read<ToggleFavoriteCartCubit>(),
                child: ProductDetailsPage(
                    product: product)), 
          ),
        );
      },
      child: Builder(builder: (context) {
        return Container(
          width: 160,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: product.thumbnail != null &&
                              product.thumbnail!.isNotEmpty
                          ? Image.network(
                              product.thumbnail!,
                              width: double.infinity,
                              height: 140,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image_not_supported),
                            )
                          : Container(
                              width: double.infinity,
                              height: 140,
                              color: Colors.grey[300],
                              child: const Icon(Icons.image_not_supported),
                            ),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onTertiary,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: IconButton(
                              onPressed: () {
                                context
                                    .read<ToggleFavoriteCartCubit>()
                                    .toggleFavorite(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isFav
                                          ? 'Removed from favorites!'
                                          : 'Added to favorites!',
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                color: AppColors.primary,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                product.description == null
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                          product.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppConstants.currency}${product.discountPercentage}",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "${AppConstants.currency} ${product.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < product.rating!.round()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

void printSnackBar(String message, BuildContext context) {
  var snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(
    snackBar,
  );
}
