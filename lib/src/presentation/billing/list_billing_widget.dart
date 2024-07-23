import 'package:flutter/material.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum MenuPopup { firstItem, secondItem }

class ListBillingWidget extends StatelessWidget {
  const ListBillingWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                print(index);
              });
        });
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
              child: SvgPicture.asset(Assets.billSvg)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Tagihan Api',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bBold(16),
              ),
              Text(
                'Sebesar Rp.5.000.000,00',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(13),
              ),
              Text(
                'Jatuh pada 12 Juni 2024',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(13),
              ),
            ],
          )),
          PopupMenuButton<MenuPopup>(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.lightgray),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: Colors.white,
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.primary,
                size: 40,
              ),
              onSelected: (MenuPopup item) {
                if (item.name == 'firstItem') {
                  print('first');
                } else {
                  print('second');
                }
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<MenuPopup>>[
                    PopupMenuItem<MenuPopup>(
                      value: MenuPopup.firstItem,
                      child:
                          Text('Detail Tagihan', style: AppTxtStyle.bLight(15)),
                    ),
                    PopupMenuItem<MenuPopup>(
                      value: MenuPopup.secondItem,
                      child: Text('Upload Bukti Transaksi',
                          style: AppTxtStyle.bLight(15)),
                    ),
                  ]),
        ]);
  }
}
