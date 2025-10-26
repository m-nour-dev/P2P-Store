import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/authentication/data/models/user_model.dart';
import 'package:p2p_store/features/authentication/data/remote/auth_remote_data_source%20.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthCubit(this.authRemoteDataSource) : super(const AuthState());

  void onPasswordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final user = await authRemoteDataSource.login(
        email: email,
        password: password,
      );

      emit(state.copyWith(isLoading: false, user: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final user = await authRemoteDataSource.register(
        email: email,
        password: password,
        name: name,
      );
      emit(state.copyWith(isLoading: false, user: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
