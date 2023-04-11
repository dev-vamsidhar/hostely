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
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [Icon(Icons.report_problem_outlined)],
                ),
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
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Name of the user',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  // Two boxes one for fee due one for fee paid
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Fee Due",
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rs. 5000",
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Fee Paid",
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rs. 5000",
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
             const Align(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "due date (For first year):- 12/12/2021",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20,
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
              customTextFeild(
                  hintText: "Parent",
                  textEditingController: TextEditingController(),
                  currentValue: "Revenue Colony, Anantapur",
                  isEnabled: false),
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
