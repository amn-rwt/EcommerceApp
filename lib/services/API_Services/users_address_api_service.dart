import 'dart:convert';
import 'package:ecommerce_app/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import '../../model/user_address.dart';

class UsersAddressApiService {
  static Future<UserAddress> getAddresses(int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl$userAddress/$id$apiKey'));

    if (response.statusCode == 200) {
      return UserAddress.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  // static Future<UserAddress> deleteAddress() async {}

  // static Future<UserAddress> updateAddress() async {}
}
