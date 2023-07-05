import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle textStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    overflow: TextOverflow.ellipsis,
  );
}

InputDecoration textInputDecoration(String text) =>
    InputDecoration(hintText: text, label: Text(text));

SizedBox horizontalSpace(int width) {
  return SizedBox(
    width: (Get.width / 100) * width,
  );
}

InputDecoration inputDecoration(String hintText, Icon icon) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: icon,
    prefixIconColor: Colors.grey,
  );
}

EdgeInsets padding(double vertical, double horizontal) {
  return EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
}
