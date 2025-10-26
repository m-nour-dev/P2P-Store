import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';
import 'package:p2p_store/features/products/data/remote/product_remote_data_source.dart';
import 'package:p2p_store/features/products/presentation/manager/response_status_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/response_status_state.dart';
import 'package:p2p_store/features/products/presentation/widgets/custum_search_bar.dart';
import 'package:p2p_store/features/products/presentation/widgets/filter_sort_bottuns.dart';
import 'package:p2p_store/features/products/presentation/widgets/product_card.dart';

class SearchPage extends StatefulWidget {
  final String? selectedCategory;
  final bool? isInCategoryItem;
  const SearchPage({super.key, this.selectedCategory, this.isInCategoryItem});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> displayedProducts = [];

  void _sortProducts(String sortType) {
    setState(() {
      switch (sortType) {
        case 'price_low_to_high':
          displayedProducts.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'price_high_to_low':
          displayedProducts.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'newest_first':
          displayedProducts.sort((a, b) {
            final dateA =
                DateTime.tryParse(a.meta?.createdAt ?? '') ?? DateTime(0);
            final dateB =
                DateTime.tryParse(b.meta?.createdAt ?? '') ?? DateTime(0);
            return dateB.compareTo(dateA);
          });
          break;
        case 'oldest_first':
          displayedProducts.sort((a, b) {
            final dateA =
                DateTime.tryParse(a.meta?.createdAt ?? '') ?? DateTime(0);
            final dateB =
                DateTime.tryParse(b.meta?.createdAt ?? '') ?? DateTime(0);
            return dateA.compareTo(dateB);
          });
          break;
      }
    });
  }

  void _filterProducts(String filterType, List<Product> originalProducts) {
    setState(() {
      switch (filterType) {
        case 'in_stock':
          displayedProducts =
              originalProducts.where((p) => (p.stock ?? 0) > 0).toList();
          break;
        case 'high_rating':
          displayedProducts =
              originalProducts.where((p) => (p.rating ?? 0) >= 4.0).toList();
          break;
        default:
          displayedProducts = List.from(originalProducts);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = ResponseStatusCubit(ProductRemoteDataSource());
        if (widget.selectedCategory != null &&
            widget.selectedCategory!.toLowerCase() == 'all') {
          cubit.fetchProducts();
        } else {
          cubit.fetchProductsByCategory(widget.selectedCategory ?? '');
        }
        return cubit;
      },
      child: BlocBuilder<ResponseStatusCubit, ResponseStatusState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.errorMessage.isNotEmpty) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          } else if (state.productList == null ||
              state.productList!.products.isEmpty) {
            return const Center(child: Text("No products found"));
          }

          final products = state.productList!.products;
          if (displayedProducts.isEmpty) {
            displayedProducts = List.from(products);
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading:
                  widget.isInCategoryItem == true ? true : false,
              toolbarHeight: 90,
              title: Column(
                children: [
                  CustumSearchBar(products: displayedProducts),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      FilterSortButtons(
                        myLabel: 'Sort',
                        myIcon: const Icon(Icons.sort, size: 14),
                        onOptionSelected: (sortType) => _sortProducts(sortType),
                      ),
                      const SizedBox(width: 5),
                      FilterSortButtons(
                        myLabel: 'Filter',
                        myIcon: const Icon(Icons.filter_alt, size: 14),
                        onOptionSelected: (filterType) =>
                            _filterProducts(filterType, products),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: displayedProducts.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.60,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  final product = displayedProducts[index];
                  return SizedBox(
                    height: 310,
                    child: ProductCard(product: product),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
