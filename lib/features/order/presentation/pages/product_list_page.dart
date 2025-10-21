import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/presentation/widgets/product_cart_widget.dart';
import '../manager/product_cubit.dart';
import '../manager/product_state.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.all(4.0),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCardWidget();
            },
          );
        },
      ),

      // m.nur sebete bastiginda urunler cikaca ve bu buttun gecici bir surligin icin kullanilmis
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductCubit>().loadSampleProducts();
        },
        child: const Icon(Icons.add),
      ),
      
    );
  }
}
