import 'package:p2p_store/features/order/data/models/product_model.dart';

class ProductState {
  final List<ProductModel> products;
  final List<ProductModel> shopProducts;
  final List<ProductModel> favoriteProducts;
  final bool selected;
  final bool favorite;
  ProductState({
    required this.favoriteProducts,
    required this.products,
    required this.shopProducts,
    required this.favorite    ,
    required this.selected,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? favoriteProducts,
    List<ProductModel>? shopProducts,
    bool? selected,
    bool? favorite,
  }) {
    return ProductState(
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      selected: selected ?? this.selected,
      favorite: favorite ?? this.favorite ,
      products: products ?? this.products,
      shopProducts: shopProducts ?? this.shopProducts,
    );
  }
}
