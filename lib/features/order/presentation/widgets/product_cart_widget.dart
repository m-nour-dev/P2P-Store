import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/data/models/product_model.dart';
import 'package:p2p_store/features/order/presentation/manager/product_cubit.dart';
import 'package:p2p_store/features/order/presentation/manager/product_state.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<ProductCubit, ProductState>(
          buildWhen: (previous, current) =>
              previous.selected != current.selected ||
              previous.favorite != current.favorite,
          builder: (BuildContext context, ProductState state) {
            // burda ilk urunu aliyor
            final ProductModel product = state.products.first;
            return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.imageUrl,
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text("Variations: ${product.variations.join(', ')}"),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "⭐ ${product.rating} ",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "upto ${product.discount}% off",
                            style: const TextStyle(color: Colors.redAccent),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "\$${product.oldPrice}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<ProductCubit>().toggleFavoriteStatus(
                          product,
                        );
                      },
                      icon: Icon(Icons.favorite),
                      color: state.favorite ? Colors.red : Colors.black26,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<ProductCubit>().toggleSelectedStatus(
                          product,
                        );
                      },
                      icon: Icon(
                        state.selected ? Icons.check_circle : Icons.add_circle,
                      ),
                      color: state.selected ? Colors.green : Colors.grey,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
