import 'package:ecommerce_app/constants/order_status.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CartProductTile extends StatelessWidget {
  final String productName;
  final String productCategory;
  final String price;
  final String status;
  const CartProductTile(
      {Key? key,
      required this.productName,
      required this.productCategory,
      required this.status,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: SizedBox(
              height: 100,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  testImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ), //productImage
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName),
                Text(productCategory),
                Text(price),
                const SizedBox(height: 10),
                Text('Status: $status')
              ],
            ),
          ), //productDescription
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: orderStatus[status]),
        ],
      ),
    );
  }
}
