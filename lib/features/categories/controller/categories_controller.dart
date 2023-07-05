import 'package:ecommerce_app/services/API_Services/product_category_api_service.dart';
import 'package:get/get.dart';
import '../../../model/product_category_model.dart';

class CategoriesController extends GetxController {
  late ProductCategory categories;

  var isLoading = false.obs;

  getAllCategories() async {
    categories = await ProductCategoryService.getAllCategories();
    categories = categories;
    isLoading.toggle();
  }
}
