import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_state.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';
import 'package:p2p_store/features/products/presentation/pages/product_details_page.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleFavoriteCartCubit, ToggleFavoriteCartState>(
      builder: (context, state) {
        final favorites = state.favoriteProducts;

        if (favorites.isEmpty) {
          return const Center(
            child: Text("No favorite products yet."),
          );
        }

        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final Product p = favorites[index];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  p.thumbnail ?? '',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported),
                ),
              ),
              title: Text(
                p.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (p.description != null)
                    Text(
                      p.description!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(
                        i < (p.rating?.round() ?? 0)
                            ? Icons.star
                            : Icons.star_border,
                        size: 16,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Text(
                    "${AppConstants.currency} ${p.price}",
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  context.read<ToggleFavoriteCartCubit>().toggleFavorite(p);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${p.title} removed from favorites'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<ToggleFavoriteCartCubit>(),
                      child: ProductDetailsPage(product: p),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
