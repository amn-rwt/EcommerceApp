import 'dart:convert';
import 'package:ecommerce_app/constants/api_constants.dart';
import 'package:ecommerce_app/model/product_item_model.dart';
import 'package:ecommerce_app/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductApiService {
  static Future<Products> getAllProduct() async {
    final response = await http.get(Uri.parse(baseUrl + products + apiKey));
    return Products.fromJson(jsonDecode(response.body));
  }

  static Future<ProductItem> getProduct(String id) async {
    final response = await http.get(Uri.parse('$baseUrl$products/$id$apiKey'));
    if (response.statusCode == 200) {
      return ProductItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
