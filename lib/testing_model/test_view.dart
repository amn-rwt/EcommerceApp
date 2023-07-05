import 'package:ecommerce_app/features/product_details/views/custom_radio.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  final List<String> radioValues = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomRadioButton(
      radioValues: radioValues,
      initialValue: 0,
    ));
  }
}
