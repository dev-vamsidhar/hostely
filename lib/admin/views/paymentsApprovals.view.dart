import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants.dart';

class PaymentApprovals extends StatelessWidget {
  const PaymentApprovals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Approvals"),
        backgroundColor: kColorPrimary,
        actions: [],
      ),
      body:const Column(
        children: [
          
        ],
      ),
    );
  }
}
