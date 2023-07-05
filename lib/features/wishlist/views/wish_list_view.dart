import 'package:ecommerce_app/features/wishlist/controller/wish_list_controller.dart';
import 'package:ecommerce_app/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final controller = Get.put(WishListController());

  @override
  void initState() {
    super.initState();
    controller.getWishtList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wishlist'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.75,
            maxCrossAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            return ProductTile(
              productName: 'productName',
              productCategory: 'productCategory',
              originalPrice: 1233,
              price: 12312,
              imageUrl: 'imageUrl',
              isInWishlist: true,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
