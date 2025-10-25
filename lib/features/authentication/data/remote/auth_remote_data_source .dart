import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:p2p_store/features/authentication/data/models/user_model.dart';

class AuthRemoteDataSource {
  final String baseUrl = "https://api.escuelajs.co/api/v1";

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final userResponse = await http.get(
        Uri.parse('$baseUrl/auth/profile'),
        headers: {'Authorization': 'Bearer ${data['access_token']}'},
      );

      if (userResponse.statusCode == 200) {
        final userData = jsonDecode(userResponse.body);
        return UserModel(
          id: userData['id'],
          username: userData['name'],
          email: userData['email'],
          password: userData['password'],
          image: userData['avatar'],
          accessToken: data['access_token'],
          refreshToken: data['refresh_token'],
        );
      } else {
        throw "We couldn’t load your account details. Please try again.";
      }
    } else if (response.statusCode == 401) {
      throw 'Incorrect email or password. Please check your credentials.';
    } else if (response.statusCode == 404) {
      throw 'This account does not exist. Please sign up first.';
    } else {
      throw 'Something went wrong while trying to log you in. Please try again later.';
    }
  }

  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'avatar': 'https://api.lorem.space/image/face?w=640&h=480',
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserModel(
        id: data['id'],
        username: data['name'],
        email: data['email'],
        password: data['password'],
        image: data['avatar'],
        accessToken: '',
        refreshToken: '',
      );
    } else if (response.statusCode == 409) {
      throw 'An account with this email already exists.';
    } else {
      throw "We couldn't create your account. Please try again later.";
    }
  }
}
