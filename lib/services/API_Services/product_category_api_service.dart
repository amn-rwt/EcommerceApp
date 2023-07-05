import 'dart:convert';

import 'package:ecommerce_app/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import '../../model/product_category_model.dart';

class ProductCategoryService {
  static Future<ProductCategory> getAllCategories() async {
    final response =
        await http.get(Uri.parse(baseUrl + productCategory + apiKey));

    return ProductCategory.fromJson(jsonDecode(response.body));
  }
}
