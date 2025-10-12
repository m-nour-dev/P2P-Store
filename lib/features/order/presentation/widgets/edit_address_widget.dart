import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/presentation/manager/address_edit_cubit.dart';
import 'package:p2p_store/features/order/presentation/pages/order_page.dart';

class EditAddressWidget extends StatelessWidget {
  const EditAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit, size: 20),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Edit Address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: OrderPage.addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: OrderPage.contactController,
                  decoration: InputDecoration(
                    labelText: "Contact Number",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<AddressEditCubit>().addreschange(
                      OrderPage.addressController.text,
                    );
                    context.read<AddressEditCubit>().telchange(
                      OrderPage.contactController.text,
                    );

                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
