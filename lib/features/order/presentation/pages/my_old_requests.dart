import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/data/models/product_model.dart';
import 'package:p2p_store/features/order/presentation/manager/product_cubit.dart';
import 'package:p2p_store/features/order/presentation/manager/product_state.dart';
import 'package:p2p_store/features/order/presentation/pages/checkout_page.dart';

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
            // Navigator.pop(context); yerine özel bir yönlendirme kullanın.

            // 1. İstenen Sayfaya Gitme ve Önceki Rotaları Temizleme
            // Bu yöntem, kullanıcıyı direkt olarak belirttiğiniz sayfaya (HomePage) götürür
            // ve geri kalan tüm sayfaları bellekten siler.
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutPage(),
              ), // DÖNÜLMEK İSTENEN SAYFA
              (Route<dynamic> route) => false, // Tüm rotaları kaldır.
            );
          },
        ),
      ),

      body: BlocBuilder<ProductCubit, ProductState>(
        buildWhen: (previous, current) =>
            previous.myOldRequests != current.myOldRequests,
        builder: (BuildContext context, ProductState state) {
          if (state.myOldRequests.isEmpty) {
            return const Center(child: Text(" Old Requests Not Fonud"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: state.myOldRequests.length,
            itemBuilder: (context, index) {
              final ProductModel product = state.myOldRequests[index];
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
