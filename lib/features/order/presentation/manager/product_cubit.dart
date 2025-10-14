import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/data/models/product_model.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit()
    : super(
        ProductState(
          products: [],
          shopProducts: [],
          favorite: false,
          selected: false,
          favoriteProducts: [],
        ),
      );

  void loadSampleProducts() {
    emit(
      state.copyWith(
        products: [
          ProductModel(
            name: "Women’s Casual Wear",
            imageUrl:
                "https://images.unsplash.com/photo-1490481651871-ab68de25d43d",
            variations: ["Black", "Red"],
            rating: 4.8,
            price: 34.00,
            oldPrice: 64.00,
            discount: 33,
            quantity: 1,
          ),
          ProductModel(
            name: "Women’s Casual Wear",
            imageUrl:
                "https://images.unsplash.com/photo-1490481651871-ab68de25d43d",
            variations: ["Yellow", "Pink"],
            rating: 2.8,
            price: 124.00,
            oldPrice: 313.00,
            discount: 83,
            quantity: 1,
          ),
        ],
      ),
    );
  }

  void addProductToFavorites(ProductModel product) {
    final updated = List<ProductModel>.from(state.favoriteProducts)
      ..add(product);
    emit(state.copyWith(favoriteProducts: updated));
  }

  void removeProductFromFavorites(ProductModel product) {
    final updated = List<ProductModel>.from(state.favoriteProducts)
      ..remove(product);
    emit(state.copyWith(favoriteProducts: updated));
  }

  void addProductToCart(ProductModel product) {
    final updated = List<ProductModel>.from(state.shopProducts)..add(product);
    emit(state.copyWith(shopProducts: updated));
  }

  void removeProductFromCart(ProductModel product) {
    final updated = List<ProductModel>.from(state.shopProducts)
      ..removeWhere((p) => p.name == product.name); // Use a unique property
    emit(state.copyWith(shopProducts: updated));
  }

  void toggleFavoriteStatus(ProductModel product) {
    final bool isCurrentlyFavorite = state.favoriteProducts.contains(product);
    List<ProductModel> updatedList = List.from(state.favoriteProducts);
    if (isCurrentlyFavorite) {
      updatedList.remove(product);
    } else {
      updatedList.add(product);
    }
    emit(
      state.copyWith(
        favorite: !isCurrentlyFavorite,
        favoriteProducts: updatedList,
      ),
    );
  }

  void toggleSelectedStatus(ProductModel product) {
    final bool isCurrentlySelected = state.shopProducts.contains(product);
    List<ProductModel> updatedList = List.from(state.shopProducts);
    if (isCurrentlySelected) {
      updatedList.remove(product);
    } else {
      updatedList.add(product);
    }
    emit(
      state.copyWith(selected: !isCurrentlySelected, shopProducts: updatedList),
    );
  }

  double get total =>
      state.shopProducts.fold(0, (sum, p) => sum + (p.price * p.quantity));
}
