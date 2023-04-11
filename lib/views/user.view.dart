import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hostely/constants.dart';
import 'package:hostely/controllers/payments.controll.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  foregroundImage: const NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                  child: Container(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Name of the user',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              customTextFeild(
                  hintText: "Room No",
                  textEditingController: TextEditingController(),
                  currentValue: "102",
                  isEnabled: false),
              const SizedBox(height: 12),
              customTextFeild(
                  hintText: "Native Address",
                  textEditingController: TextEditingController(),
                  currentValue: "Revenue Colony, Anantapur",
                  isEnabled: false),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            child: ElevatedButton(
              //set color
              style: ElevatedButton.styleFrom(
                primary: kColorPrimary,
              ),
              onPressed: () {
                PaymentController().payRent();
              },
              child: const Text("Pay Rent"),
            ),
          ),
        ),
      ],
    );
  }
}
