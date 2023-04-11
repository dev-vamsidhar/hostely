import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void payRent() {
    EasyLoading.show(status: 'Encrypting the data');
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.showSuccess('Payment Successful');
    });
  }
}
