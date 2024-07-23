import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'list_payment_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pembayaran', style: AppTxtStyle.wTitleNav)),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: Column(children: <Widget>[
                        AppSearchbar(
                            title: 'pembayaran',
                            onSubmit: (value) {
                              print(value);
                            }).addPd(y: 10),
                        ListPaymentWidget()
                      ]).addPd(all: 10)))
              .addRefresher(
                  bgColor: AppColors.green,
                  onRefresh: () async {
                    print('refreshsed');
                  });
        })));
  }
}
