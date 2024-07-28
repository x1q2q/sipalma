import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'package:sipalma/src/utils/constants.dart';
import 'package:sipalma/src/application/payment/payments_service.dart';
import 'package:sipalma/src/domain/payment/payment.dart';

class ListPaymentWidget extends ConsumerWidget {
  const ListPaymentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentAsyncValue = ref.watch(fetchPaymentsProvider);

    return AsyncValueWidget<List<Payment>>(
        value: paymentAsyncValue,
        data: (data) => ListView.separated(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                AppStyle.yGapSm,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (BuildContext context, int index) {
              Payment item = data[index];
              List<Widget> bottomSheetContent = [
                headBottomSheet(item),
                bodyBottomSheet(item)
              ];
              return CardTile(
                height: 95,
                widget: contentTile(item),
                onTap: () async {
                  await UIHelper.modalSheet(
                      context: context,
                      child: AppBottomsheet(
                        colWidget: bottomSheetContent,
                      ));
                },
              );
            }));
  }

  Widget headspan(String teks) {
    return Text(teks, style: AppTxtStyle.bBold(14))
        .addPd(y: 4, x: 8)
        .addInkWell(color: AppColors.lightgreen)
        .addBdRadius(20);
  }

  Widget headBottomSheet(Payment item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        headspan('Tagihan ${item.title}'),
        headspan(
          'Sebesar ${item.total.toString().toRupiah()}',
        )
      ],
    ).addPd(y: 15);
  }

  Widget bodyBottomSheet(Payment item) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Anda telah mengupload bukti transaksi pada: ${item.createdAt.toFormattedDate('dd MMMM yyyy')}',
            style: AppTxtStyle.bLight(16),
          ),
          AppStyle.yGapSm,
          Image.network('${Constants.pathImageProof}/${item.imageProof}')
              .addBdRadius(18)
              .addBorder(color: AppColors.primary, radius: 18),
        ]);
  }

  Widget contentTile(Payment item) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: 80,
              height: 95,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.green),
                  borderRadius: BorderRadius.circular(18)),
              child: SvgPicture.asset(Assets.paymentSvg)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Pembayaran Tagihan ${item.title} #${item.id}',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bBold(16),
              ),
              Text(
                'Sebesar ${item.total.toString().toRupiah()}',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(13),
              ),
              Text(
                'Telah upload pada ${item.createdAt.toFormattedDate('dd MMMM yyyy')}',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(13),
              ),
            ],
          ))
        ]);
  }
}
