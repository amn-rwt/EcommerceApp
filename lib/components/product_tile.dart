import 'package:flutter/material.dart';

import '../components/styling_widgets.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.isInWishlist,
    required this.productName,
    required this.productCategory,
    required this.originalPrice,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);
  final bool isInWishlist;
  final String productName;
  final String productCategory;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: isInWishlist
                        ? const Icon(
                            Icons.close,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                color: Colors.white,
                              )
                            ],
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.grey[500],
                            shadows: const [
                              Shadow(
                                color: Colors.black,
                              )
                            ],
                          ))
              ],
            ),
            Text(productName, style: textStyle(16)),
            Text(
              productCategory,
              style: textStyle(14),
            ),
            Row(
              children: [
                Text(
                  ('Rs.${price.toString()}'),
                  style: textStyle(12),
                ),
                const SizedBox(width: 5),
                Text(
                  'Rs.${originalPrice.toString()}',
                  style: const TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
