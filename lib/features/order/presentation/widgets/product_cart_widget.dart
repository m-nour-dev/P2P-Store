import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/presentation/pages/shoping_bag.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_state.dart';

class ProductCardWidget extends StatelessWidget {
  final int index;
  const ProductCardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<ToggleFavoriteCartCubit, ToggleFavoriteCartState>(
          buildWhen: (previous, current) =>
              previous.cartProducts != current.cartProducts,
          builder: (BuildContext context, state) {
            final product = state.cartProducts;
            return Row(
              children: [
                 ClipRRect(
                   borderRadius: BorderRadius.circular(12),
                   child: Image.network(
                     product[index].thumbnail!,
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
                        product[index].brand.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "⭐ ${product[index].rating} ",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "\$${product[index].price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 6),
                        ],
                      ),
                    ],
                  ),
                ),

                
              ],
            );
          },
        ),
        
      ),
      
    );
  }
}
