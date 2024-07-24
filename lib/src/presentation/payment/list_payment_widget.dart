import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';

class ListPaymentWidget extends StatelessWidget {
  const ListPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomSheetContent = [headBottomSheet(), bodyBottomSheet()];
    return ListView.separated(
        itemCount: 20,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => AppStyle.yGapSm,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return CardTile(
            height: 95,
            widget: contentTile(),
            onTap: () async {
              await UIHelper.modalSheet(
                  context: context,
                  child: AppBottomsheet(
                    colWidget: bottomSheetContent,
                  ));
            },
          );
        });
  }

  Widget headspan(String teks) {
    return Text(teks, style: AppTxtStyle.bBold(14))
        .addPd(y: 4, x: 8)
        .addInkWell(color: AppColors.lightgreen)
        .addBdRadius(20);
  }

  Widget headBottomSheet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[headspan('Tagihan Api'), headspan('Rp. 50.000')],
    ).addPd(y: 15);
  }

  Widget bodyBottomSheet() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Anda telah mengupload bukti transaksi pada: \n12 Juni 2024,15:00',
            style: AppTxtStyle.bLight(16),
          ),
          AppStyle.yGapSm,
          Image.asset(Assets.bukti)
              .addBdRadius(18)
              .addBorder(color: AppColors.primary, radius: 18),
        ]);
  }

  Widget contentTile() {
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
                'Pembayaran Tagihan Api',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bBold(16),
              ),
              Text(
                'Sebesar Rp.5.000.000,00',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(13),
              ),
              Text(
                'Telah upload pada 12 Juni 2024, 15:00',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(13),
              ),
            ],
          ))
        ]);
  }
}
