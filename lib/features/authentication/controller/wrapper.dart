import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/features/home/views/home_view.dart';
import 'package:ecommerce_app/features/authentication/views/login_view.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return (user != null) ? const HomeScreen() : const LoginPage();
  }
}
