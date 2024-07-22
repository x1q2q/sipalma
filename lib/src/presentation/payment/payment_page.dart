import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pembayaran', style: AppTxtStyle.wTitleNav)),
        body: const SafeArea(child: Center(child: Text('payment page'))));
  }
}
