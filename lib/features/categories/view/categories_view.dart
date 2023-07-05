import 'package:ecommerce_app/features/categories/controller/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/widgets.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  final controller = Get.put(CategoriesController());

  @override
  void initState() {
    controller.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Categories',
        ),
        body: Obx(() {
          return controller.isLoading.isFalse
              ? const Center(child: CustomProgressIndicator())
              : ListView.builder(
                  itemCount: controller.categories.records!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller
                          .categories.records![index].fields!.name
                          .toString()),
                      trailing: const Icon(Icons.arrow_right_sharp),
                    );
                  },
                );
        }));
  }
}
