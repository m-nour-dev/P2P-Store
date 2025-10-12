import 'dart:convert' as convert;
import 'package:p2p_store/features/products/data/models/product_models.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  final String basUrl = 'https://dummyjson.com';
  Future<ProductListModel> getProducts() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com'));

      if (response.statusCode == 200) {
        final jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return ProductListModel.fromJson(jsonData);
      } else {
        throw Exception('Server connection failed! ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fethcing data! $e');
    }
  }
}
