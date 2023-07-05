import 'package:ecommerce_app/model/product_item_model.dart';
import 'package:ecommerce_app/services/API_Services/api_service.dart';
import 'package:get/state_manager.dart';

class ProductDetailsController extends GetxController {
  RxBool isLoading = false.obs;

  late ProductItem item;
  getProductDetails(String id) async {
    item = await ProductApiService.getProduct(id);
    item = item;
  }
}
