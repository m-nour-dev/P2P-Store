import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/data/models/product_model.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit()
    : super(
        ProductState(
          myOldRequests: [],
          products: [],
          shopProducts: [],
          selected: false,
        ),
      );

  // bunu kaldirmam gerekiyor cunku m.nurdan gelen productler burda olacak
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

  void addProductToCart(ProductModel product) {
    final updated = List<ProductModel>.from(state.shopProducts)..add(product);
    emit(state.copyWith(shopProducts: updated));
  }

  // benim yaptigim eski talepler
  void addProductToMyOldRequests() {
   // final updated = List<ProductModel>.from(state.shopProducts)..add(product);
    emit(state.copyWith(myOldRequests: state.shopProducts, shopProducts: []));
  }
  // bu fonkisyonu shoping listesinde silinecek urun icin kullaniilir

  void removeProductFromCart(ProductModel product) {
    state.products.remove(product);
    emit(state.copyWith(products: state.products));
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
