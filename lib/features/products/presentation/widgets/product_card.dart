import 'package:flutter/material.dart';
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
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
                child:
                    product.thumbnail != null && product.thumbnail!.isNotEmpty
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_border)),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
            child: Row(
              children: [
                Text(
                  "${AppConstants.currency}  ${product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                const SizedBox(width: 6),
                Text(
                  "${AppConstants.currency}${product.discountPercentage}",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
        ],
      ),
    );
  }
}
