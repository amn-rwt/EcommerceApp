// import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app/features/authentication/views/login_view.dart';
import 'package:ecommerce_app/services/API_Services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResgisterUserAuthController extends GetxController {
  final firebase = FirebaseAuthServices();

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  late String uid;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  registerUser() async {
    firebase
        .createWithEmailNdPassword(
            emailTextEditingController.text, passwordTextEditingController.text)
        .then((value) => uid = value.user!.uid);
    // users.add({
    //   'userID': uid,
    //   'email': emailTextEditingController.text,
    // }).then((value) {
    //   Get.to(() => const LoginPage());
    //   log('User Added uid: $uid');
    // });
  }
}
