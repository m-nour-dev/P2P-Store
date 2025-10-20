import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/data/remote/product_remote_data_source.dart';
import 'package:p2p_store/features/products/presentation/manager/response_status_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/response_status_state.dart';
import 'package:p2p_store/features/products/presentation/widgets/product_card.dart';

class SearchPage extends StatelessWidget {
  final String? selectedCategory;

  const SearchPage({super.key, this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = ResponseStatusCubit(ProductRemoteDataSource());

        // ✅ هنا أضفنا الشرط الذي طلبته
        if (selectedCategory != null &&
            selectedCategory!.toLowerCase() == 'all') {
          cubit.fetchProducts(); // ✅ جلب جميع المنتجات بدون فلترة
        } else {
          cubit.fetchProductsByCategory(selectedCategory ?? '');
        }

        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory != null
                ? 'Category: $selectedCategory'
                : 'Search Products',
          ),
        ),
        body: BlocBuilder<ResponseStatusCubit, ResponseStatusState>(
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

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.60,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return SizedBox(
                      height: 310, child: ProductCard(product: product));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
