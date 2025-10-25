import 'package:p2p_store/features/products/data/models/product_models.dart';

class ToggleFavoriteCartState {
  //final bool isFavorite;
  final bool isCartItem;
  final List<Product> favoriteProducts;
  final List<Product> cartProducts;
  final List<Product> myOldMypreviousrequestsrequest;

  ToggleFavoriteCartState(
      {required this.myOldMypreviousrequestsrequest,
      //required this.isFavorite,
      required this.isCartItem,
      required this.favoriteProducts,
      required this.cartProducts});

  ToggleFavoriteCartState copyWith({
    bool? isFavorite,
    bool? isCartItem,
    List<Product>? favoriteProducts,
    List<Product>? cartProducts,
    List<Product>? myOldMypreviousrequestsrequest,
  }) {
    return ToggleFavoriteCartState(
        //isFavorite: isFavorite ?? this.isFavorite,
        isCartItem: isCartItem ?? this.isCartItem,
        favoriteProducts: favoriteProducts ?? this.favoriteProducts,
        cartProducts: cartProducts ?? this.cartProducts,
        myOldMypreviousrequestsrequest: myOldMypreviousrequestsrequest ??
            this.myOldMypreviousrequestsrequest);
  }
}
