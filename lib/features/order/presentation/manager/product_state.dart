import 'package:p2p_store/features/order/data/models/product_model.dart';

class ProductState {
  final List<ProductModel> products;
  final List<ProductModel> shopProducts;
  final List<ProductModel> myOldRequests;
  final bool selected;
  ProductState({
    required this.myOldRequests,
    required this.products,
    required this.shopProducts,
    required this.selected,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? shopProducts,
    List<ProductModel>? myOldRequests,
    bool? selected,
  }) {
    return ProductState(
      myOldRequests: myOldRequests ?? this.myOldRequests,
      selected: selected ?? this.selected,
      products: products ?? this.products,
      shopProducts: shopProducts ?? this.shopProducts,
    );
  }
}
