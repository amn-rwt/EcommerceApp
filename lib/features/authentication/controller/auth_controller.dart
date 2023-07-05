import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_app/constants/api_constants.dart';
import 'package:ecommerce_app/features/home/views/home_view.dart';
import 'package:ecommerce_app/model/current_user_model.dart';
import 'package:ecommerce_app/services/API_Services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final mobileController = TextEditingController();
  final addr1Controller = TextEditingController();
  final addr2Controller = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();

  final firebaseAuth = FirebaseAuthServices();
  late final CurrentUser currentUser;

  loginWithEmailNdPassword() async {
    await firebaseAuth
        .loginWithEmailNdPassword(emailController.text, passwordController.text)
        .then((value) => log(value.user!.uid.toString()));
    // currentUser = await getCurrentUser();
    Get.to(const HomeScreen());
  }

  loginWithGoogle() async {
    await firebaseAuth.loginWithGoogle();
  }

  // register() {
  //   registerNewUser(
  //     emailController.text,
  //     fnameController.text,
  //     lnameController.text,
  //     mobileController.text,
  //   );
  // }

  // registerNewUser(
  //     String email, String fname, String lname, String phone) async {
  //   await firebaseAuth
  //       .createWithEmailNdPassword(
  //           emailController.text, passwordController.text)
  //       .then((value) => log(value.user!.uid.toString()));
  //   await UsersApiService.createNewUser(email, phone, fname, lname);
  //   Get.to(() => const LoginPage());
  // }

  // registerNewUser() {
  //   registerUser(emailController.text, passwordController.text);
  // }

  Future<CurrentUser> getCurrentUser() async {
    final response = await http.get(Uri.parse(
        '$baseUrl$users$apiKey&filterByFormula={email}="${emailController.text}"'));
    if (response.statusCode == 200) {
      return CurrentUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
