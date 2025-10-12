import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/product_cubit.dart';
import '../manager/product_state.dart';

class ShopingBag extends StatelessWidget {
  const ShopingBag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Bag"), centerTitle: true,actions: [IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))],),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.shopProducts.isEmpty) {
            return const Center(child: Text("No items in cart"));
          }
          final product = state.shopProducts.first;
          final total = context.read<ProductCubit>().total;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 🛍️ Product card
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      product.imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
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
                          Text("Qty: ${product.quantity}"),
                          Text(
                            " ${product.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Delivery by 10 May 20XX",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 💸 Coupon section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Apply Coupons"),
                      Text(
                        "Select",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🧾 Order details
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
                        "Order Amounts",
                        "₹ ${total.toStringAsFixed(2)}",
                      ),
                      _priceRow("Convenience", "Apply Coupon", highlight: true),
                      _priceRow("Delivery Fee", "Free", free: true),
                      const Divider(),
                      _priceRow(
                        "Order Total",
                        "₹ ${total.toStringAsFixed(2)}",
                        bold: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),

      // 🛒 Bottom bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                final total = context.read<ProductCubit>().total;
                return Text(
                  "₹ ${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // ödeme sayfasına yönlendir
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
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
    bool highlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: highlight ? Colors.grey : Colors.black,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: free
                  ? Colors.green
                  : highlight
                  ? Colors.red
                  : Colors.black,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
