import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';

class SearchCubit extends Cubit<SearchState> {
  final List<Product> allProducts;

  SearchCubit(this.allProducts) : super(SearchState(query: '', suggestions: []));

  void updateQuery(String query) {
    final filtered = allProducts
        .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchState(query: query, suggestions: filtered));
  }
}

class SearchState {
  final String query;
  final List<Product> suggestions;

  SearchState({required this.query, required this.suggestions});
}
