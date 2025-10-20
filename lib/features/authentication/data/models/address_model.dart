class AddressModel {
  final String? id; 
  final String? userId;
  final String? fullName;
  final String? pincode;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? phoneNumber;

  AddressModel({
    this.id, 
    
    this.userId,
    this.fullName,
    this.pincode,
    this.address,
    this.city,
    this.state,
    this.country,
    this.phoneNumber,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'], 
      userId: json['userId'],
      fullName: json['fullName'],
      pincode: json['pincode'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fullName': fullName,
      'pincode': pincode,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'phoneNumber': phoneNumber,
    };
  }
}
