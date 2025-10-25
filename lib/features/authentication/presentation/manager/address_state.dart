import 'package:p2p_store/features/authentication/data/models/address_model.dart';

class AddressState {
  final Map<int, List<AddressModel>> addressesByUser;
  final bool isLoading;
  final String? errorMessage;

  const AddressState({
    this.addressesByUser = const {},
    this.isLoading = false,
    this.errorMessage,
  });

  AddressState copyWith({
    Map<int, List<AddressModel>>? addressesByUser,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AddressState(
      addressesByUser: addressesByUser ?? this.addressesByUser,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
