import 'package:p2p_store/features/products/data/models/product_models.dart';

class ResponseStatusState {
  final bool isLoading;
  final String errorMessage;
  final ProductListModel? productList;

  ResponseStatusState(
      {required this.isLoading,
      required this.errorMessage,
      required this.productList});

  ResponseStatusState copyWith({
    bool? isLoading,
    String? errorMessage,
    ProductListModel? productList,
  }) {
    return ResponseStatusState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        productList: productList ?? this.productList);
  }
}
