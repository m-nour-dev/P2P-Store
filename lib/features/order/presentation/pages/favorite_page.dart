import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/data/models/product_model.dart';
import 'package:p2p_store/features/order/presentation/manager/product_cubit.dart';
import 'package:p2p_store/features/order/presentation/manager/product_state.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites'), centerTitle: true),

      body: BlocBuilder<ProductCubit, ProductState>(
        buildWhen: (previous, current) =>
            previous.favoriteProducts != current.favoriteProducts,
        builder: (BuildContext context, ProductState state) {
          if (state.favoriteProducts.isEmpty) {
            return const Center(child: Text("favorite Not found"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: state.favoriteProducts.length,
            itemBuilder: (context, index) {
              final ProductModel product = state.favoriteProducts[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          product.imageUrl,
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox(
                                height: 90,
                                width: 90,
                                child: Icon(Icons.broken_image),
                              ),
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
                            Text(
                              "Variations: ${product.variations.join(', ')}",
                            ),

                            const SizedBox(height: 10),

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

                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            context.read<ProductCubit>().toggleFavoriteStatus(
                              product,
                            );
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: state.favorite ? Colors.red : Colors.black26,
                          ),
                        ),
                        
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
