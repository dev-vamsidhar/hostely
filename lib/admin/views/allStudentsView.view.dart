import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostely/admin/controllers/adminController.dart';
import 'package:hostely/admin/views/room.view.dart';

import '../../constants.dart';

class AllStudents extends StatelessWidget {
  AllStudents({super.key});
  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 230, 230),
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
        return ListView.builder(
          itemCount: adminController.roomMappings.keys.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(Rooms(
                      students: adminController.roomMappings[
                          adminController.roomMappings.keys.toList()[index]]));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          adminController.roomMappings.keys.toList()[index] +
                              " - ${adminController.roomMappings[adminController.roomMappings.keys.toList()[index]]?.length.toString()} Students",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
