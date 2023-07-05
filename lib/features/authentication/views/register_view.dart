import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/features/authentication/controller/register_user_auth_controller.dart';
import 'package:ecommerce_app/features/authentication/views/login_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/styling_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = Get.put(ResgisterUserAuthController());
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          padding: padding(10, 16),
          child: Column(children: [
            Image.network(imageURL),
            TextField(
              controller: controller.emailTextEditingController,
              // decoration: decoration('email', const Icon(Icons.email)))
              decoration: const InputDecoration(
                hintText: 'email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextField(
              obscureText: _isObsecure,
              controller: controller.passwordTextEditingController,
              decoration: InputDecoration(
                  hintText: 'password',
                  prefixIcon: const Icon(Icons.vpn_key),
                  suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                      icon: _isObsecure
                          ? const Icon(Icons.visibility)
                          : const Icon(
                              Icons.visibility_off,
                            ))),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: padding(10, 16), primary: Colors.black),
                  onPressed: () {
                    controller.registerUser();
                    // Get.to(() => CompleteProfile());
                  },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Text.rich(TextSpan(children: [
              const TextSpan(text: 'Already registered?'),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(() => const LoginPage());
                    },
                  text: 'Login',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ))
            ]))
          ]),
        ),
      ),
    );
  }
}
