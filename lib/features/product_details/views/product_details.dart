import 'package:ecommerce_app/features/product_details/controller/product_details_controller.dart';
import 'package:ecommerce_app/components/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/progress_indicator.dart';
import '../../../components/styling_widgets.dart';
import '../testData.dart';
import 'custom_radio.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final controller = Get.put(ProductDetailsController());

  @override
  void initState() {
    controller.getProductDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => (controller.isLoading.isTrue)
            ? const Center(child: CustomProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Stack(children: [
                    PageView.builder(
                        itemCount:
                            controller.item.fields!.productImages!.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            color: Colors.blueGrey,
                            height: (Get.height) * 2 / 3,
                            width: Get.width,
                            child: Image.network(
                              controller
                                  .item.fields!.productImages![index].url!,
                              fit: BoxFit.cover,
                            ),
                          );
                        })),
                    Positioned(
                      top: 10,
                      left: 16,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 16,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ])),
                  Container(
                    height: Get.height / 3,
                    padding: padding(10, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.item.fields!.productName!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.item.fields!.description!,
                          style: textStyle(14),
                        ),
                        Row(
                          children: [
                            Text(controller.item.fields!.price!.toString()),
                            Text(
                              controller.item.fields!.price!.toString(),
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Select Size'),
                        CustomRadioButton(
                          initialValue: 0,
                          radioValues: shoeSizes,
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: ListTile(
                              tileColor: Colors.black,
                              onTap: () {},
                              title: const Text(
                                'Add to Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      )),
    );
  }
}
