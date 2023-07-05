import 'package:ecommerce_app/components/cart_product_tile.dart';
import 'package:ecommerce_app/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../testing_model/products.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Your Cart'),
      body: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => Space(
              height: 1,
            ),
            itemCount: products.length - 5,
            itemBuilder: (context, index) {
              return const CartProductTile(
                price: '1023',
                productCategory: 'ProductCategory',
                productName: 'ProductName',
                status: 'Arriving Soon',
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total'),
                    Text('Rs. total'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Discount'),
                    Text(
                      'Rs. discount',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Sub total'),
                    Text('Rs. total'),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          SizedBox(
            width: Get.width - 32,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }
}
