import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hostely/admin/controllers/adminController.dart';

import '../../constants.dart';

class StudentsApproval extends StatelessWidget {
  StudentsApproval({super.key});

  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 235, 235),
      appBar: AppBar(
        title: Text("Approvals"),
        backgroundColor: kColorPrimary,
        actions: [
          InkWell(
              onTap: () {
                adminController.getNonApprovedUsers();
              },
              child: Icon(Icons.replay_outlined))
        ],
      ),
      body: GetBuilder<AdminController>(builder: (_) {
        return adminController.unApprovedStudents.isEmpty
            ? Center(child: Text("All users are approved/deleted"))
            : ListView.builder(
                itemCount: adminController.unApprovedStudents.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              adminController.unApprovedStudents[index].name +
                                  "-" +
                                  adminController
                                      .unApprovedStudents[index].phone,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Parent Phone - ${adminController.unApprovedStudents[index].parentPhone}"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Aadhar - ${adminController.unApprovedStudents[index].aadhar}"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Roll No-  ${adminController.unApprovedStudents[index].rollNo}"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      TextEditingController rent =
                                          TextEditingController();
                                      TextEditingController roomNo =
                                          TextEditingController();
                                      Get.defaultDialog(
                                          title: "Enter the details",
                                          content: Column(
                                            children: [
                                              customTextFeild(
                                                  hintText: "Enter the rent",
                                                  textEditingController: rent,
                                                  currentValue: "",
                                                  isEnabled: true),
                                              customTextFeild(
                                                  hintText:
                                                      "Enter the room name",
                                                  textEditingController: roomNo,
                                                  currentValue: "",
                                                  isEnabled: true),
                                              InkWell(
                                                onTap: () {
                                                  if (rent.text.isNotEmpty &&
                                                      roomNo.text.isNotEmpty) {
                                                    adminController.approveUser(
                                                        uid: adminController
                                                                .unApprovedIds[
                                                            index],
                                                        rent: rent.text,
                                                        roomNo: roomNo.text);
                                                  } else {
                                                    EasyLoading.showError(
                                                        "Enter all details");
                                                  }
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.green),
                                                    child: Center(
                                                        child: Text("Approve",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ));
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text("Approve",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      adminController.deleteUser(
                                          uid: adminController
                                              .unApprovedIds[index]);
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
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
