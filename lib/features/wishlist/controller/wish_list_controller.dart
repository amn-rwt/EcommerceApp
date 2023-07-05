import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_app/constants/api_constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../../../model/wish_list_model.dart';

class WishListController extends GetxController {
  addToWishList() async {
    final response = await http.post(Uri.parse(baseUrl + wishlist + apiKey),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(<String, dynamic>{
          'fields': {
            'items': '1',
            'user_id': ['reco0TespZ7EH6Aj9'],
          }
        }));

    print(response.statusCode);
    print(response.body);
  }

  late WishList wishList;

  Future getWishtList() async {
    final response = await http.get(Uri.parse(baseUrl + wishlist + apiKey));
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      wishList = WishList.fromJson(jsonDecode(response.body));
    }
    wishList = wishList;
  }
}
