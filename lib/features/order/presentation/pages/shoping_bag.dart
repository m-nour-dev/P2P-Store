import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/core/constants/strip_keys.dart';
import 'package:p2p_store/features/order/presentation/manager/payment_manager.dart';
import 'package:p2p_store/features/order/presentation/pages/payment_failed_page.dart';
import 'package:p2p_store/features/order/presentation/pages/payment_success_page.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_state.dart';
import 'package:p2p_store/features/products/presentation/pages/wishlist_page.dart';

class ShopingBag extends StatelessWidget {
  const ShopingBag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Bag"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishlistPage()),
              );
            },
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),

      body: BlocBuilder<ToggleFavoriteCartCubit, ToggleFavoriteCartState>(
        builder: (context, state) {
          if (state.cartProducts.isEmpty) {
            return const Center(child: Text("No items in cart"));
          }

          final productList = state.cartProducts;
          
          final total = context.read<ToggleFavoriteCartCubit>().total;

          return Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  product.thumbnail!,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),

                              // 🧾 Ürün Detayları
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.brand.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      product.title,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black87),
                                    ),

                                    const SizedBox(height: 6),

                                    Row(
                                      children: [
                                        const Icon(Icons.star,
                                            color: Colors.amber, size: 18),
                                        Text(
                                          " ${product.rating}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      "\$${product.price.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.green,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    // 🔹 Ek detaylar
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (product.category != null)
                                          Text(
                                            "Category: ${product.category}",
                                            style: const TextStyle(
                                                color: Colors.black54),
                                          ),
                                        if (product.stock != null)
                                          Text(
                                            "Stock: ${product.stock} available",
                                            style: const TextStyle(
                                                color: Colors.black54),
                                          ),
                                        if (product.description != null)
                                          Text(
                                            product.description!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
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
                  ),
                ),

                const SizedBox(height: 10),

                // 🧾 Ödeme Detayları
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      const Text(
                        "Order Payment Details",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      _priceRow(
                          "Order Amount", "USD ${total.toStringAsFixed(2)}"),
                      _priceRow("Delivery Fee", "Free", free: true),
                      const Divider(),
                      _priceRow(
                          "Order Total", "USD ${total.toStringAsFixed(2)}",
                          bold: true),
                          
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        
      ),

      // 💳 Alt Kısım — Ödeme Butonu
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ToggleFavoriteCartCubit, ToggleFavoriteCartState>(
              builder: (context, state) {
                final total = context.read<ToggleFavoriteCartCubit>().total;
                return Text(
                  "USD ${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                Stripe.publishableKey = ApiKeys.publishableKey;
                bool result = await PaymentManager.makePayment(
                  context.read<ToggleFavoriteCartCubit>().total.toInt(),
                  "USD",
                );

                if (!context.mounted) return;

                if (result) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                          value: context.read<ToggleFavoriteCartCubit>(),
                          child: PaymentSuccessPage()),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentFailedPage(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                "Proceed to Payment",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(
    String title,
    String value, {
    bool bold = false,
    bool free = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: free ? Colors.green : Colors.black,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
