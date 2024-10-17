import 'dart:convert';

import 'package:ecommerce/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String baseUrl = 'https://dummyjson.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('$baseUrl/category/womens-shoes'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return (data['products'] as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Future<ProductModel> fetchProductDetails(int id) async {
  //   final response = await http.get(Uri.parse('$baseUrl/$id'));
  //   if (response.statusCode == 200) {
  //     return ProductModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load product details');
  //   }
  // }
}
