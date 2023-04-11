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
                          Container(
                            child: Center(
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
                                    "\$ 5000.00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
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
                              Text("5000"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Due (Year - 2022):",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
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
