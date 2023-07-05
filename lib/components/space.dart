import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Space extends StatelessWidget {
  double? width;
  double? height;
  Space({Key? key, this.width = 0, this.height = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (Get.width / 100) * width!,
      height: (Get.height / 100) * height!,
    );
  }
}
