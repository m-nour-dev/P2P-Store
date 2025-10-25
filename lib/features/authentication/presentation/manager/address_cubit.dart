import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/authentication/data/models/address_model.dart';
import 'package:p2p_store/features/authentication/presentation/manager/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(const AddressState());

  void addAddress(int userId, AddressModel newAddress) {
    final updated = Map<int, List<AddressModel>>.from(state.addressesByUser);
    final userAddresses = List<AddressModel>.from(updated[userId] ?? []);
    userAddresses.add(newAddress);
    updated[userId] = userAddresses;
    emit(state.copyWith(addressesByUser: updated));
  }

  

}
  