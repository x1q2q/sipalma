import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';

class BillingPage extends StatelessWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tagihan', style: AppTxtStyle.wTitleNav)),
        body: const SafeArea(child: Center(child: Text('biling page'))));
  }
}
