import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hostely/models/user.model.dart';
import 'package:hostely/views/login.view.dart';

import '../views/home.view.dart';
import '../views/profilePage.dart';
import 'firebase/firebase.controller.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  String currentUserRole = "user";

  late UserModel userData;
  Future onBoardUser(UserModel user) async {
    try {
      bool isSaved = await FirebaseContorller().setDoc(
          collectionPath: "users", document: getUid(), data: user.toJson());
      userData = user;
      if (isSaved) {
        Get.offAll(HomePage());
      } else {
        EasyLoading.showError(
            "Something went wrong, Contact admin@vamsidhar.in");
      }
    } catch (e) {
      EasyLoading.showError("Something went wrong");
    }
  }

  Future handleNewUser() async {
    try {
      EasyLoading.show(status: "Checking user");
      bool isNew = await FirebaseContorller()
          .hasDoc(collectionpath: "users", docId: getUid());
      EasyLoading.dismiss();
      if (isNew) {
        Get.offAll(HomePage());
      } else {
        Get.offAll(ProfilePage());
      }
    } catch (e) {
      EasyLoading.showError(
          "Something went wrong.Contact at admin@vamsidhar.in");
    }
  }

  Future getUser() async {
    EasyLoading.show(status: "Fetching user details");
    Map<String, dynamic> user = await FirebaseContorller()
        .getDoc(collectionPath: "users", document: getUid());
    userData = UserModel.fromJson(user);
    update();
    EasyLoading.dismiss();
  }

  Future editUser() async {}

  Future paidRent(int amount) async {
    userData.paidAmount = (int.parse(userData.paidAmount) + amount).toString();
    await FirebaseContorller().setDoc(
        collectionPath: "users", document: getUid(), data: userData.toJson());
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
