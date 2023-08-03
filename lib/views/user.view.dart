import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hostely/constants.dart';
import 'package:hostely/controllers/firebase/firebase.controller.dart';
import 'package:hostely/controllers/payments.controll.dart';
import 'package:hostely/controllers/user.controller.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return GetBuilder<UserController>(builder: (_) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.report_problem_outlined),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      foregroundImage: const NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                      child: Container(),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '${userController.userData.name}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amount Due",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "\₹ ${int.parse(userController.userData.rent) - int.parse(userController.userData.paidAmount)}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Paid:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green),
                                  ),
                                  Text(
                                      "₹ ${int.parse(userController.userData.paidAmount)}"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "last Paid (Year - 2022):",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 88, 88, 88)),
                                  ),
                                  Text("22/05/2002"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customTextFeild(
                      hintText: "Room No",
                      textEditingController: TextEditingController(),
                      currentValue: userController.userData.roomNo,
                      isEnabled: false),
                  customTextFeild(
                      hintText: "Roll no",
                      textEditingController: TextEditingController(),
                      currentValue: userController.userData.rollNo,
                      isEnabled: false),
                  customTextFeild(
                      hintText: "Phone",
                      textEditingController: TextEditingController(),
                      currentValue: userController.userData.phone,
                      isEnabled: false),
                  customTextFeild(
                      hintText: "Native Address",
                      textEditingController: TextEditingController(),
                      currentValue: userController.userData.address,
                      isEnabled: false),
                  customTextFeild(
                      hintText: "Parent Phone",
                      textEditingController: TextEditingController(),
                      currentValue: userController.userData.parentPhone,
                      isEnabled: false),
                  customTextFeild(
                      hintText: "Aadhar",
                      textEditingController: TextEditingController(),
                      currentValue: userController.userData.aadhar,
                      isEnabled: false),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                //set color
                style: ElevatedButton.styleFrom(
                  backgroundColor: kColorPrimary,
                ),
                onPressed: () {
                  TextEditingController amount = TextEditingController();
                  String paymentText = "Pay";
                  Get.defaultDialog(
                      title: "Payment confimation",
                      content: Column(
                        children: [
                          Text("Amount want to be pay"),
                          customTextFeild(
                              hintText: "Amount",
                              textEditingController: amount,
                              currentValue: "",
                              isEnabled: true),
                          InkWell(
                            onTap: () async {
                              PaymentController().payRent(amount: amount.text);
                              if (paymentText == "Paid (press after sucess)") {
                                await PaymentController()
                                    .reduceRentagainstPayment(amount.text,
                                        userController.userData.paidAmount);
                                await userController.getUser();
                                Get.back();
                                EasyLoading.showToast(
                                    "Approval sent to owner he will contact and update it",
                                    toastPosition:
                                        EasyLoadingToastPosition.bottom);
                              }
                              paymentText = "Paid (press after sucess)";
                              userController.update();
                            },
                            child: GetBuilder<UserController>(builder: (_) {
                              return Container(
                                height: 50,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    paymentText,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green),
                              );
                            }),
                          )
                        ],
                      ));
                },
                child: const Text("Pay Rent"),
              ),
            ),
          ),
        ],
      );
    });
  }
}
