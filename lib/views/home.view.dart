import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hostely/admin/views/admin.view.dart';
import 'package:hostely/constants.dart';
import 'package:hostely/views/login.view.dart';
import 'package:hostely/views/user.view.dart';

import '../controllers/authentication.controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorScaffoldBg,
        appBar: AppBar(
          title: const Text("My Space"),
          backgroundColor: kColorPrimary,
          actions: [
            IconButton(
              icon: const Icon(Icons.chat),
              onPressed: () async {
                EasyLoading.showToast("Message still pending...",
                    toastPosition: EasyLoadingToastPosition.bottom);
                // await AuthenticationController().signOut();
                // Get.offAll(LoginPage());
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await AuthenticationController().signOut();
                Get.offAll(LoginPage());
              },
            )
          ],
        ),
        body:
            FirebaseAuth.instance.currentUser!.email != "admin@happyliving.com"
                ? AdminHomePage()
                : UserPage());
  }
}
