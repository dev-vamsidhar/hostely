import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hostely/views/login.view.dart';

import '../views/home.view.dart';
import 'firebase/firebase.controller.dart';

class UserController extends GetxController {
  String currentUserRole = "user";

  Future<void> creteUser(
      {required String email, required String password}) async {
    String uid = getUid();
    await FirebaseContorller().setDoc(
        collectionPath: 'users',
        data: {"email": email, "password": password, "role": "user"},
        document: uid);
    Get.offAll(HomePage());
  }

  static String getUid() {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (user == null) {
      Get.offAll(LoginPage());
    } else {
      uid = user.uid;
    }
    return uid;
  }
}
