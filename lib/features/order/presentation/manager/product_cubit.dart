import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/data/models/product_model.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit()
    : super(ProductState(products: [], shopProducts: [], favorit: false));

  void addProduct(ProductModel product) {
    final updated = List<ProductModel>.from(state.products)..add(product);
    emit(state.copyWith(products: updated));
  }

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

  void shopProducts(final ProductModel shopping) {
    final List<ProductModel> newShoppingList = List.from(state.shopProducts);
    newShoppingList.add(shopping);
    emit(state.copyWith(shopProducts: newShoppingList));
  }

  void toggleFavorite() {
    emit(state.copyWith(favorit: !state.favorit));
  }

  double get total =>
      state.shopProducts.fold(0, (sum, p) => sum + (p.price * p.quantity));
}
