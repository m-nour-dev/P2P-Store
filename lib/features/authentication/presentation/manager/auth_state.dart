import 'package:p2p_store/features/authentication/data/models/user_model.dart';

class AuthState {
  final String email;
  final String password;
  final bool isLoading;
  final UserModel? user;
  final String? errorMessage;

  const AuthState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    UserModel? user,
    String? errorMessage,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage,
    );
  }
}
