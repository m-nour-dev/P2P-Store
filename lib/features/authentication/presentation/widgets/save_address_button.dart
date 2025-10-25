import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/authentication/data/models/address_model.dart';
import 'package:p2p_store/features/authentication/presentation/manager/address_cubit.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:p2p_store/features/authentication/presentation/manager/auth_state.dart';

class SaveButton extends StatelessWidget {
  final TextEditingController addressController;
  final TextEditingController countryController;
  final TextEditingController stateController;
  final TextEditingController phoneController;
  final userId;

  const SaveButton({
    super.key,
    required this.addressController,
    required this.countryController,
    required this.stateController,
    required this.phoneController, 
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        final user = authState.user;

        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (user == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("User not found! Please login again."),
                  ),
                );
                return;
              }

              final newAddress = AddressModel(
                address: addressController.text,
                country: countryController.text,
                state: stateController.text,
                phoneNumber: phoneController.text,
              );

              context.read<AddressCubit>().addAddress(user.id, newAddress);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Address saved successfully ✅"),
                ),
              );
            },
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
