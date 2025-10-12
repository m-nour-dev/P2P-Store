import 'package:flutter/material.dart';
import 'package:p2p_store/features/order/presentation/pages/product_list_page.dart';
import 'package:p2p_store/features/order/presentation/pages/shoping_bag.dart';
import 'package:p2p_store/features/order/presentation/widgets/add_new_adsress_widget.dart';
import 'package:p2p_store/features/order/presentation/widgets/address_card_widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  static final addressController = TextEditingController();
  static final contactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.location_on_outlined, color: Colors.black54),
                SizedBox(width: 8),
                Text(
                  "Delivery Address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: Row(children: [AddressCardWidget()])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [AddNewAdsressWidget()],
                ),
              ],
            ),

            SizedBox(height: 15),
            Stack(
              children: [
                Text(
                  "Shopping List",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShopingBag(),
                          ),
                        );
                      },
                      icon: Icon(Icons.shopping_cart_checkout),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(child: ProductListPage()),
          ],
        ),
      ),
    );
  }
}
