class UserModel {
  final int id;
  final String username;
  final String email;
  final String password;
  final String? image;
  final String accessToken;
  final String? refreshToken;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    this.image,
    required this.accessToken,
    this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      image: json['image'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'accessToken': accessToken,
    };
    if (refreshToken != null) {
      map['refreshToken'] = refreshToken;
    }
    if (image != null) {
      map['image'] = image;
    }
    return map;
  }
}
