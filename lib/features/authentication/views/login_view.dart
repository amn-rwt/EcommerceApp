import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/features/authentication/controller/auth_controller.dart';
import 'package:ecommerce_app/services/API_Services/firebase_auth_services.dart';
import 'package:ecommerce_app/features/home/views/home_view.dart';
import 'package:ecommerce_app/features/authentication/views/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/space.dart';
import '../../../components/styling_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(AuthController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    final services = FirebaseAuthServices();

    return Material(
      child: Container(
        padding: padding(10, 16),
        child: Column(children: [
          Space(
            height: 10,
          ),
          Image.network(imageURL),
          TextField(
              controller: controller.emailController,
              decoration: inputDecoration('email', const Icon(Icons.email))),
          TextField(
            obscureText: _isObsecure,
            controller: controller.passwordController,
            decoration: InputDecoration(
                hintText: 'password',
                prefixIcon: const Icon(Icons.vpn_key),
                prefixIconColor: Colors.grey,
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObsecure = !_isObsecure;
                      });
                    },
                    icon: _isObsecure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off))),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: padding(10, 16)),
                onPressed: () async {
                  controller
                      .loginWithEmailNdPassword()
                      .then((value) => Get.to(() => const HomeScreen()));
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          SizedBox(
            height: Get.height / 10,
          ),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: padding(10, 16),
                  primary: Colors.black,
                ),
                onPressed: () async {
                  await services.loginWithGoogle();
                  Get.to(() => const HomeScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'lib/assets/images/google_icon.png',
                      width: 20,
                    ),
                    const Text(
                      'LOGIN WITH GOOGLE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: padding(10, 16), primary: Colors.black),
                onPressed: () async {
                  await services.signInAnonymously();
                  Get.to(() => const HomeScreen());
                },
                child: const Text(
                  'LOGIN ANONYMOUSLY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          Text.rich(TextSpan(children: [
            const TextSpan(
              text: 'Not a user?',
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(() => const RegisterPage());
                },
              text: 'Register',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            )
          ]))
        ]),
      ),
    );
  }
}
