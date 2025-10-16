import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/data/remote/product_remote_data_source.dart';
import 'package:p2p_store/features/products/presentation/manager/response_status_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/response_status_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResponseStatusCubit(ProductRemoteDataSource())..fetchProducts(),
      child: Scaffold(
        body: BlocBuilder<ResponseStatusCubit, ResponseStatusState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMessage.isNotEmpty) {
              return Center(child: Text("حدث خطأ: ${state.errorMessage}"));
            } else if (state.productList == null) {
              return const Center(child: Text("لا توجد بيانات"));
            }

            final products = state.productList!.products;
            
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, i) {
                final p = products[i];
                return ListTile(
                  //leading: Image.network(p.thumbnail, width: 60),
                  title: Text(p.title),
                  subtitle: Text("${p.price} \$"),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
