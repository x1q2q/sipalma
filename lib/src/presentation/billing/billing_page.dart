import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/application/billing/billings_service.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'list_billing_widget.dart';

class BillingPage extends ConsumerWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: Text('Tagihan', style: AppTxtStyle.wTitleNav)),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: Column(children: <Widget>[
                        AppSearchbar(
                            title: 'tagihan',
                            onSubmit: (value) {
                              print(value);
                            }).addPd(y: 10),
                        const ListBillingWidget()
                      ]).addPd(all: 10)))
              .addRefresher(
                  bgColor: AppColors.green,
                  onRefresh: () async {
                    ref.refresh(fetchBillingsProvider.future);
                  });
        })));
  }
}
