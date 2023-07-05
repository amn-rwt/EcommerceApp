import 'package:ecommerce_app/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class CompleteProfile extends StatelessWidget {
  CompleteProfile({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Complete Profile'),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (Get.width / 2) - (Get.width / 100) * 5,
                    child: TextField(
                      controller: controller.fnameController,
                      decoration: const InputDecoration(hintText: 'FirstName'),
                    ),
                  ),
                  SizedBox(
                    width: (Get.width / 2) - (Get.width / 100) * 5,
                    child: TextField(
                      controller: controller.lnameController,
                      decoration: const InputDecoration(hintText: 'LastName'),
                    ),
                  ),
                ],
              ),
              Space(height: 2),
              TextField(
                controller: controller.mobileController,
                decoration: const InputDecoration(
                    hintText: 'Mobile', prefixIcon: Icon(Icons.phone)),
              ),
              Space(height: 4),
              const Text(
                'ADDRESS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Space(height: 2),
              const TextField(
                controller: null,
                decoration: InputDecoration(
                  hintText: 'Address Line 1',
                ),
              ),
              Space(height: 2),
              const TextField(
                controller: null,
                decoration: InputDecoration(
                  hintText: 'Address Line 2',
                ),
              ),
              Space(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (Get.width / 2) - (Get.width / 100) * 5,
                    child: const TextField(
                      controller: null,
                      decoration: InputDecoration(hintText: 'City'),
                    ),
                  ),
                  SizedBox(
                    width: (Get.width / 2) - (Get.width / 100) * 5,
                    child: const TextField(
                      controller: null,
                      decoration: InputDecoration(hintText: 'Postal Code'),
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    // controller.register();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: padding(10, 16),
                    primary: Colors.black,
                  ),
                  child: const Text('SAVE'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
