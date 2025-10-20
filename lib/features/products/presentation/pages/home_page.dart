import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/features/products/data/remote/product_remote_data_source.dart';
import 'package:p2p_store/features/products/presentation/manager/response_status_cubit.dart';
import 'package:p2p_store/features/products/presentation/manager/response_status_state.dart';
import 'package:p2p_store/features/products/presentation/widgets/category_row.dart';
import 'package:p2p_store/features/products/presentation/widgets/custum_search_bar.dart';
import 'package:p2p_store/features/products/presentation/widgets/deal_card.dart';
import 'package:p2p_store/features/products/presentation/widgets/deal_of_the_day.dart';
import 'package:p2p_store/features/products/presentation/widgets/filter_sort_bottuns.dart';
import 'package:p2p_store/features/products/presentation/widgets/offers_bar.dart';
import 'package:p2p_store/features/products/presentation/widgets/page_bottom_section.dart';
import 'package:p2p_store/features/products/presentation/widgets/product_list_horizontal.dart';
import 'package:p2p_store/features/products/presentation/widgets/reward_card.dart';
import 'package:p2p_store/features/products/presentation/widgets/sponsored_add.dart';
import 'package:p2p_store/features/products/presentation/widgets/summer_offers_card.dart';
import 'package:p2p_store/features/products/presentation/widgets/trending_products_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ResponseStatusCubit(ProductRemoteDataSource())..fetchProducts(),
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
            //final categories = products[0].category;

            return SingleChildScrollView(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                spacing: 8,
                children: [
                  CustumSearchBar(products: products),
                  Row(
                    children: [
                      Text(
                        'All Featured',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      FilterSortBottuns(
                          myLabel: 'Sort', myIcon: Icon(Icons.sort, size: 14)),
                      SizedBox(width: 5),
                      FilterSortBottuns(
                          myLabel: 'filter',
                          myIcon: Icon(Icons.filter_alt, size: 14)),
                    ],
                  ),
                  SizedBox(height: 5),
                  CategoryRow(),
                  SizedBox(
                    height: 5,
                  ),
                  DealCard(),
                  SizedBox(
                    height: 5,
                  ),
                  DealOfTheDay(),
                  SizedBox(height: 290, child: ProductListHorizontal()),
                  SizedBox(height: 10),
                  OffersBar(),
                  RewardCard(),
                  SizedBox(height: 10),
                  TrendingProductsBar(),
                  SizedBox(height: 290, child: ProductListHorizontal()),
                  SizedBox(height: 10),
                  SummerOffersCard(),
                  SponsoredAdd(),
                  PageBottomSection()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
