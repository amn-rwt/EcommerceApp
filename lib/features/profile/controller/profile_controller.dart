import 'package:ecommerce_app/features/authentication/views/login_view.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/profile/views/edit_profile.dart';
import 'package:ecommerce_app/services/API_Services/firebase_auth_services.dart';
import 'package:get/get.dart';

class ProfileControler extends GetxController {
  final firebase = FirebaseAuthServices();

  logout() async {
    await firebase.signout().then((value) => Get.to(() => const LoginPage()));
    HomeController.isItemsLoaded.toggle();
  }
}
