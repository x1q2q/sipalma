import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/application/payment/payments_service.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'list_payment_widget.dart';

class PaymentPage extends ConsumerWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        const ListPaymentWidget()
                      ]).addPd(all: 10)))
              .addRefresher(
                  bgColor: AppColors.green,
                  onRefresh: () async {
                    ref.refresh(fetchPaymentsProvider);
                  });
        })));
  }
}
