class AddressEditState {
  final String address;
  final String contact;
  final List<Map<String, String>> addresses;

  AddressEditState({
    required this.address,
    required this.contact,
    required this.addresses,
  });

  AddressEditState copyWith({
    String? address,
    String? contact,
    List<Map<String, String>>? addresses,
  }) {
    return AddressEditState(
      address: address ?? this.address,
      contact: contact ?? this.contact,
      addresses: addresses ?? this.addresses,
    );
  }
}
