import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hostely/constants.dart';
import 'package:hostely/controllers/authentication.controller.dart';
import 'package:hostely/views/signup.view.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorScaffoldBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Center(
                child: Text(
                  "Welcome back to\n$appName",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kColorPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              customTextFeild(
                  hintText: "Email",
                  textEditingController: emailController,
                  currentValue: "",
                  isEnabled: true),
              SizedBox(
                height: 10,
              ),
              customTextFeild(
                  hintText: "Password",
                  textEditingController: passwordController,
                  currentValue: "",
                  isEnabled: true),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await AuthenticationController().signIn(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                      primary: kColorPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(SignUp());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:
                      Center(child: Text("Already have an account? Sign up")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
