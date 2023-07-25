import 'package:flutter/material.dart';

const kColorPrimary = Color(0xff6574cf);
const kColorScaffoldBg = Color(0xffEFF2FF);
const kColorTextFieldFill = Color(0xffF7F9FC);

const appName = "Happy living";

/* 
This is the custom text input fields which we have used to take input from the user.

Required parameters:
    1) hintText - The hint text which will be displayed in the text input field.
    2) controller - The controller with the help of this we can perform many operations 
    on text field like validation, addting text to input field, clear text in text input field.
    3) isEnabled - If we want to enable or disable text input field.
*/
class customTextFeild extends StatelessWidget {
  const customTextFeild(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      required this.currentValue,
      required this.isEnabled,
      this.validation = false});
  final String hintText;
  final TextEditingController textEditingController;
  final bool isEnabled;
  final String? currentValue;
  final bool validation;

  @override
  Widget build(BuildContext context) {
    textEditingController.text = currentValue.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextField(
        controller: textEditingController,
        enabled: isEnabled,
        style: TextStyle(
            fontSize: 14,
            height: 2.5,
            color: isEnabled ? Colors.black : Colors.black),
        decoration: InputDecoration(
          fillColor: kColorTextFieldFill,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kColorPrimary, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          label: Text(
            hintText,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
