import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/presentation/manager/address_edit_cubit.dart';
import 'package:p2p_store/features/order/presentation/pages/product_list_page.dart';
import 'package:p2p_store/features/order/presentation/widgets/address_card_widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  static final addressController = TextEditingController();
  static final contactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressEditCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Checkout'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
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
                ],
              ),
              SizedBox(height: 15),
              Stack(
                children: [
                  Text(
                    "Shopping List",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(child: ProductListPage()),
            ],
          ),
        ),
      ),
    );
  }
}
