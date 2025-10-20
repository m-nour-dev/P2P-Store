import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/data/remote/product_remote_data_source.dart';
import 'package:p2p_store/features/products/presentation/manager/response_status_state.dart';

class ResponseStatusCubit extends Cubit<ResponseStatusState> {
  final ProductRemoteDataSource _remoteDataSource;
  ResponseStatusCubit(this._remoteDataSource)
      : super(ResponseStatusState(
          isLoading: false,
          errorMessage: '',
          productList: null,
        ));

  Future<void> fetchProducts() async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final products = await _remoteDataSource.getProducts();
      emit(state.copyWith(isLoading: false, productList: products));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  //fethc products by category
  Future<void> fetchProductsByCategory(String category) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final products = await _remoteDataSource.getProductsByCategory(
          category);
      emit(state.copyWith(isLoading: false, productList: products));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
