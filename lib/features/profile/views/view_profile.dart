import 'package:ecommerce_app/features/authentication/controller/auth_controller.dart';
import 'package:ecommerce_app/features/profile/controller/profile_controller.dart';
import 'package:ecommerce_app/features/profile/views/edit_profile.dart';
import 'package:ecommerce_app/services/API_Services/firebase_auth_services.dart';
import 'package:ecommerce_app/features/orders/views/orders.dart';
import 'package:ecommerce_app/features/wishlist/views/wish_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nil/nil.dart';
import '../../../components/widgets.dart';

class ViewProfile extends StatelessWidget {
  ViewProfile({Key? key}) : super(key: key);
  final firebase = FirebaseAuthServices();

  final controller = Get.put(ProfileControler());
  final currnetUser = Get.put(AuthController());
  final arrowRightIcon = const Icon(Icons.arrow_right);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Profile'),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueGrey,
              ),
              const Text(
                'username',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              MenuListTile(
                title: 'Edit Profile',
                navigateTo: const EditProfile(),
                icon: arrowRightIcon,
              ),
              const SizedBox(
                height: 5,
              ),
              MenuListTile(
                title: 'Your Orders',
                navigateTo: const Orders(),
                icon: arrowRightIcon,
              ),
              const SizedBox(
                height: 5,
              ),
              MenuListTile(
                title: 'Wish List',
                navigateTo: const WishList(),
                icon: arrowRightIcon,
              ),
              const SizedBox(
                height: 5,
              ),
              MenuListTile(
                title: 'Help & Support',
                navigateTo: nil,
                icon: arrowRightIcon,
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                dense: true,
                tileColor: Colors.grey[200],
                onTap: () => controller.logout(),
                title: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
