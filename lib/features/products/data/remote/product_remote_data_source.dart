import 'dart:convert' as convert;
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  Future<ProductListModel> getProducts() async {
    try {
      final response = await http.get(Uri.parse('${AppConstants.baseUrl}/products'));

      if (response.statusCode == 200) {
        final jsonData =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        return ProductListModel.fromJson(jsonData);
      } else {
        throw Exception('Server connection failed! ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fethcing data! $e');
    }
  }
  
//get products by category
Future<ProductListModel> getProductsByCategory(String category) async {
  try {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/products/category/$category'),
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return ProductListModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load category products');
    }
  } catch (e) {
    throw Exception('Error while fetching category products: $e');
  }
}

}
