import 'package:ecommerce_app/services/API_Services/products_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/products_model.dart';

class HomeController extends GetxController {
  late Products products;

  static RxBool isItemsLoaded = true.obs;

  RxBool isSearchActive = false.obs;

  startSearch() {
    isSearchActive.toggle();
    searchQueryController.text = '';
  }

  final searchQueryController = TextEditingController();

  getAllProducts() async {
    products = await ProductApiService.getAllProduct();
    products = products;
    isItemsLoaded.toggle();
  }
}
