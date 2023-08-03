import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_upi_pay/Src/payment.dart';
import 'package:get/get.dart';
import 'package:hostely/controllers/firebase/firebase.controller.dart';
import 'package:hostely/controllers/user.controller.dart';
import 'package:upi_payment_flutter/upi_payment_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future payRent({required String amount}) async {
    EasyLoading.show(status: 'Encrypting the data');
    FlutterPayment flutterPayment = FlutterPayment();
    try {
      String url =
          'phonepe://upi:/pay?pa=9182539100@ybl&pn=vamsi&am=$amount&tn=HostelFee&cu=INR';
      launch(url);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError("Something went wrong do manual payment");
    }
  }

  Future reduceRentagainstPayment(String amount, String paidamount) async {
    EasyLoading.show(status: "Updating Payment");
    await FirebaseContorller().setDoc(
        collectionPath: "users",
        document: FirebaseAuth.instance.currentUser!.uid,
        data: {
          "paidAmount": (int.parse(paidamount) + int.parse(amount)).toString()
        });
    await FirebaseContorller()
        .setDoc(collectionPath: "payments", document: "", data: {
      "amount": amount,
      "uid": FirebaseAuth.instance.currentUser?.uid,
      "date": DateTime.now(),
      "previousPaid": paidamount,
      "approved": false,
    });
   
    EasyLoading.dismiss();
  }
}
