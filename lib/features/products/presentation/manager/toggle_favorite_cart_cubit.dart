import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_state.dart';

class ToggleFavoriteCartCubit extends Cubit<ToggleFavoriteCartState> {
  ToggleFavoriteCartCubit()
      : super(ToggleFavoriteCartState(
            //isFavorite: false,
            isCartItem: false,
            favoriteProducts: [],
            cartProducts: []));

 void toggleFavorite(Product product) {
    final favorites = List<Product>.from(state.favoriteProducts);

    // 🔍 تحقق إذا كان هناك منتج بنفس الـ id
    final existingIndex = favorites.indexWhere((p) => p.id == product.id);

    if (existingIndex != -1) {
      // ✅ إذا وُجد — نحذفه (أي إلغاء الإضافة للمفضلة)
      favorites.removeAt(existingIndex);
    } else {
      // ✅ إذا لم يوجد — نضيفه إلى المفضلة
      favorites.add(product);
    }

    emit(state.copyWith(favoriteProducts: favorites));
  }


  void toggleCartItem() {
    emit(state.copyWith(isCartItem: !state.isCartItem));
  }
    bool isFavorite(Product product) {
    return state.favoriteProducts.any((p) => p.id == product.id);
  }
  void addToFavorite(Product product) {
    List<Product> favoriteList = state.favoriteProducts;
    favoriteList.add(product);
    emit(state.copyWith(favoriteProducts: favoriteList));
  }

  void addToCart(Product product) {
    List<Product> cartList = state.cartProducts;
    cartList.add(product);
    emit(state.copyWith(cartProducts: cartList));
  }

  void removeFromFavorite(Product product) {
    List<Product> favoriteList = state.favoriteProducts;
    favoriteList.remove(product);
    emit(state.copyWith(favoriteProducts: favoriteList));
  }

  void removeFromCart(Product product) {
    List<Product> cartList = state.cartProducts;
    cartList.remove(product);
    emit(state.copyWith(cartProducts: cartList));
  }
}
