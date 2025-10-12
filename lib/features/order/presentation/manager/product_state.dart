import 'package:p2p_store/features/order/data/models/product_model.dart';

class ProductState {
  final List<ProductModel> products;
  final List<ProductModel> shopProducts;
  final bool favorit;
  ProductState({required this.products, required this.shopProducts,required this.favorit});

  ProductState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? shopProducts,
     bool ? favorit
  }) {
    return ProductState(
      favorit: favorit ?? this.favorit,
      products: products ?? this.products,
      shopProducts: shopProducts ?? this.shopProducts,
    );
  }
}
