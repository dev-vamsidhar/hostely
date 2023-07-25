import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hostely/controllers/user.controller.dart';
import 'package:upi_payment_flutter/upi_payment_flutter.dart';

class PaymentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future payRent({required int amount}) async {
    EasyLoading.show(status: 'Encrypting the data');
    final UpiPaymentHandler upiPaymentHandler = UpiPaymentHandler();
    try {
      bool success = await upiPaymentHandler.initiateTransaction(
        payeeVpa: '9110519517@ybl',
        payeeName: 'Happy living',
        transactionRefId: 'TXN123456',
        transactionNote: 'Hostel feee',
        amount: 10.0,
      );
      if (success) {
        await UserController().paidRent(amount);
        EasyLoading.showSuccess('Payment Successful');
      } else {
        EasyLoading.showError(
            "Something went wrong, Contact admin@vamsidhar.in");
      }
    } catch (e) {
      EasyLoading.showError("Something went wrong do manual payment");
    }
  }

  Future reduceRentagainstPayment() async {}
}
