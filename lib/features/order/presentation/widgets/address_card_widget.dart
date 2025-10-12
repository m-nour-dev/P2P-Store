import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/presentation/manager/address_edit_cubit.dart';
import 'package:p2p_store/features/order/presentation/manager/address_edit_state.dart';
import 'package:p2p_store/features/order/presentation/widgets/edit_address_widget.dart';

class AddressCardWidget extends StatelessWidget {
  const AddressCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressEditCubit, AddressEditState>(
      builder: (context, state) {
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Positioned(right: 0, top: 0, child: EditAddressWidget()),

                BlocBuilder<AddressEditCubit, AddressEditState>(
                  buildWhen: (previous, current) =>
                      previous.address != current.address ||
                      previous.contact != current.contact,
                  builder: (BuildContext context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          "Address :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(state.address),
                        Text("Contact : ${state.contact}"),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
