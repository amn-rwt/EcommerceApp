import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'styling_widgets.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(padding: padding(10, 16)),
          onPressed: onTap,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
