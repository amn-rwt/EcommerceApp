import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/widgets.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Profile'),
      body: Material(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              children: [
                TextField(
                  controller: null,
                  decoration: textInputDecoration('First Name'),
                ),
                TextField(
                  controller: null,
                  decoration: textInputDecoration('Last Name'),
                ),
                TextField(
                  controller: null,
                  decoration: textInputDecoration('Username'),
                ),
                TextField(
                  controller: null,
                  decoration: textInputDecoration('Email'),
                ),
                TextField(
                  controller: null,
                  decoration: textInputDecoration('Phone'),
                ),
                Space(height: 4),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'ADDRESS',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'edit',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                    Space(height: 1),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                          'Non consequat consectetur sint commodo ad enim.'),
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: padding(10, 16),
                        primary: Colors.black,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
