import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
          title: Text("My Space"),
          backgroundColor: kColorPrimary,
          actions: [
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () async {
                await AuthenticationController().signOut();
                Get.offAll(LoginPage());
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
            FirebaseAuth.instance.currentUser!.email == "admin@happyliving.com"
                ? AdminHomePage()
                : UserPage());
  }
}
