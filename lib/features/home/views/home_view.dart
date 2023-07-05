import 'package:badges/badges.dart';
import 'package:ecommerce_app/constants/asset_constants.dart';
import 'package:ecommerce_app/features/cart/views/cart_screen.dart';
import 'package:ecommerce_app/features/categories/view/categories_view.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/profile/views/view_profile.dart';
import 'package:ecommerce_app/features/product_details/views/product_details.dart';
import 'package:ecommerce_app/components/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/product_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isSearchActive = false;
  final searchQueryController = TextEditingController();
  late AnimationController animationController;
  final _pageViewController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );

  final controller = Get.put(HomeController());

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    controller.getAllProducts();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    searchQueryController.dispose();
    _pageViewController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {
      isSearchActive = !isSearchActive;
      searchQueryController.text = '';
    });
    if (isSearchActive) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final value = animationController.value;
            return Stack(
              children: [
                Transform.translate(
                  offset: Offset(value * -200, 0),
                  child: child,
                ),
                if (value > 0)
                  Opacity(
                    opacity: value,
                    child: TextField(
                      autofocus: true,
                      controller: searchQueryController,
                      decoration: const InputDecoration(hintText: 'Search'),
                    ),
                  )
              ],
            );
          },
          child: GestureDetector(
            onTap: () => Get.to(() => ViewProfile()),
            child: const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 20,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            // padding: EdgeInsets.zero,
            child: IconButton(
              // onPressed: () => setState(() {
              //   isSearchActive = !isSearchActive;
              // }),
              onPressed: _startSearch,
              icon: isSearchActive
                  ? const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 35,
                    )
                  : const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 35,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            // padding: EdgeInsets.zero,
            child: Badge(
              position: BadgePosition.topEnd(end: -2, top: -2),
              badgeContent: const Text(
                '1',
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  onPressed: () => Get.to(() => const CartScreen()),
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 35,
                  )),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 250,
                child: PageView.builder(
                  controller: _pageViewController,
                  clipBehavior: Clip.none,
                  itemCount: productImage.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        // height: 250,
                        // width: Get.width,
                        child: Image.asset(
                          productImage[index],
                          fit: BoxFit.cover,
                          height: 250,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('CATEGORIES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  GestureDetector(
                    onTap: () => Get.to(() => const ProductCategoryScreen()),
                    child: const Text(
                      'see all',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              Obx(() {
                return HomeController.isItemsLoaded.isTrue
                    ? const Center(
                        child: CustomProgressIndicator(),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.products.records!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 0.75,
                          maxCrossAxisExtent: 200,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ProductTile(
                              onTap: () => Get.to(() => ProductDetails(
                                  id: controller.products.records![index].id!)),
                              isInWishlist: false,
                              imageUrl: controller.products.records![index]
                                  .fields!.productImages![0].url
                                  .toString(),
                              productName: controller
                                  .products.records![index].fields!.productName
                                  .toString(),
                              productCategory: controller
                                  .products.records![index].fields!.categoryId
                                  .toString(),
                              originalPrice: 100,
                              price: controller
                                  .products.records![index].fields!.price!
                                  .toDouble());
                        },
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
