import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/presentation/manager/address_edit_cubit.dart';

class AddNewAdsressWidget extends StatelessWidget {
  AddNewAdsressWidget({super.key});
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 93,
      height: 93,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.add_circle_outline, size: 35),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  16,
                  20,
                  16,
                  MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Add New Address",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: contactController,
                      decoration: const InputDecoration(
                        labelText: "Contact Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AddressEditCubit>().addAddress(
                          addressController.text,
                          contactController.text,
                        );
                        Navigator.pop(context);
                      },
                      child: const Text("Add"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
