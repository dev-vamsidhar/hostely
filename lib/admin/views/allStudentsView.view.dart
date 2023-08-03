import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostely/admin/controllers/adminController.dart';

import '../../constants.dart';

class AllStudents extends StatelessWidget {
  AllStudents({super.key});
  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All students"),
        backgroundColor: kColorPrimary,
        actions: [
          InkWell(
              onTap: () {
                adminController.getAllusers();
              },
              child: Icon(Icons.replay_outlined))
        ],
      ),
      body: GetBuilder<AdminController>(builder: (_) {
        return Column(
          children: [],
        );
      }),
    );
  }
}
