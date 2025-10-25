import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_state.dart';
import 'package:p2p_store/features/products/presentation/widgets/main_layout.dart';

class MyOldRequests extends StatelessWidget {
  const MyOldRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Old Requests '),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<ToggleFavoriteCartCubit>().removeAllshopingBag();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MainLayout(),
              ),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: BlocBuilder<ToggleFavoriteCartCubit, ToggleFavoriteCartState>(
        buildWhen: (previous, current) =>
            previous.myOldMypreviousrequestsrequest !=
            current.myOldMypreviousrequestsrequest,
        builder: (BuildContext context, state) {
          if (state.myOldMypreviousrequestsrequest.isEmpty) {
            return const Center(child: Text(" Old Requests Not Fonud"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: state.myOldMypreviousrequestsrequest.length,
            itemBuilder: (context, index) {
              final product = state.myOldMypreviousrequestsrequest[index];
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
                          product.thumbnail!,
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
                              product.brand!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
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
                                  "\$${product.price}",
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
