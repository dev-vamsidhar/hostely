import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hostely/constants.dart';
import 'package:hostely/controllers/user.controller.dart';
import 'package:hostely/models/user.model.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController aadhar = TextEditingController();
  TextEditingController rollNo = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController parentphone = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                if (name.text.isNotEmpty &&
                    rollNo.text.isNotEmpty &&
                    aadhar.text.isNotEmpty &&
                    phone.text.isNotEmpty &&
                    parentphone.text.isNotEmpty &&
                    address.text.isNotEmpty) {
                  UserController().onBoardUser(UserModel(
                      name: name.text,
                      aadhar: aadhar.text,
                      photo: "",
                      phone: phone.text,
                      parentPhone: parentphone.text,
                      address: address.text,
                      approved: false,
                      rollNo: rollNo.text));
                } else {
                  EasyLoading.showInfo("Fill all feilds");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: kColorPrimary,
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: 50,
                child: const Center(
                    child: Text(
                  "Complete Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
              ),
            ),
          ),
          Column(
            children: [
              customTextFeild(
                  hintText: "Name",
                  textEditingController: name,
                  currentValue: "",
                  isEnabled: true),
              customTextFeild(
                  hintText: "Aadhar",
                  textEditingController: aadhar,
                  currentValue: "",
                  isEnabled: true),
              customTextFeild(
                  hintText: "Phone No.",
                  textEditingController: phone,
                  currentValue: "",
                  isEnabled: true),
              customTextFeild(
                  hintText: "Parent Phone",
                  textEditingController: parentphone,
                  currentValue: "",
                  isEnabled: true),
              customTextFeild(
                  hintText: "address",
                  textEditingController: address,
                  currentValue: "",
                  isEnabled: true),
              customTextFeild(
                  hintText: "RollNo(if Not given enter 000)",
                  textEditingController: rollNo,
                  currentValue: "",
                  isEnabled: true),
            ],
          ),
        ],
      ),
    );
  }
}
