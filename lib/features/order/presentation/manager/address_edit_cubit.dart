import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/presentation/manager/address_edit_state.dart';

class AddressEditCubit extends Cubit<AddressEditState> {
  AddressEditCubit()
    : super(
        AddressEditState(
          address: 'profilden gelen addres burda koyulacak',
          contact: '+905355',
          addresses: [{}],
        ),
      );

  void addreschange(String ads) {
    emit(state.copyWith(address: ads));
  }

  void telchange(String tel) {
    emit(state.copyWith(contact: tel));
  }
  void addAddress(String address, String contact) {
    final newList = List<Map<String, String>>.from(state.addresses);
    newList.add({
      'address': address,
      'contact': contact,
    });
    emit(state.copyWith(addresses: newList));
  }
}
