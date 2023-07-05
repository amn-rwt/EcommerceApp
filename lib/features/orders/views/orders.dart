import 'package:ecommerce_app/components/cart_product_tile.dart';
import 'package:ecommerce_app/testing_model/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
          title:
              const Text('Your Orders', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return const CartProductTile(
                    productName: 'productName',
                    productCategory: 'productCategory',
                    status: 'Arriving Soon',
                    price: 'price');
              }),
        ));
  }
}
