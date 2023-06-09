import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hostely/constants.dart';
import 'package:hostely/controllers/user.controller.dart';
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
              icon: Icon(Icons.logout),
              onPressed: () {
                AuthenticationController().signOut();
              },
            )
          ],
        ),
        body: Get.find<UserController>().currentUserRole == "user"
            ? UserPage()
            : Container());
  }
}
