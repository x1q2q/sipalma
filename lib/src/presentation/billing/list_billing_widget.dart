import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sipalma/src/res/styles/app_txt_style.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';

enum MenuPopup { firstItem, secondItem }

class ListBillingWidget extends StatelessWidget {
  const ListBillingWidget({super.key});

  Future<bool?> openSheet(BuildContext context, List<Widget> colWidget) async {
    return UIHelper.modalSheet(
        context: context,
        child: AppBottomsheet(
          colWidget: colWidget,
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> detailContent = [headBottomSheet(), bodyDetail(context)];
    List<Widget> uploadContent = [headBottomSheet(), bodyMedia()];
    return ListView.separated(
        itemCount: 20,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => AppStyle.yGapSm,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return CardTile(
            height: 95,
            widget: contentTile(context,
                colWidget1: detailContent, colWidget2: uploadContent),
            onTap: () async {
              await openSheet(context, detailContent);
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

  Widget bodyDetail(BuildContext context) {
    List<Widget> colWidget = [headBottomSheet(), bodyUpload()];
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '''Silahkan upload bukti transaksi ke nomor rekening berikut:\n
- BRI (628 003343242) a.n Gilga Scream
- BCA (628 003343242) a.n Gilga Scream
- BNI (628 003343242) a.n Gilga Scream
- Mandiri (628 003343242) a.n Gilga Scream''',
            style: AppTxtStyle.bLight(16),
          ),
          AppStyle.yGapSm,
          Center(
              child: ElevatedButton(
                  onPressed: () async {
                    context.pop();
                    await openSheet(context, colWidget);
                  },
                  style: AppBtnStyle.outlineGreenSm,
                  child: Text('Pilih Media', style: AppTxtStyle.gLight(18))))
        ]);
  }

  Widget inkButton(List<Widget> colWidget, void Function() onPress) {
    return Expanded(
        child: SizedBox.fromSize(
                child: Container(
                        height: 120,
                        width: 120,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: colWidget))
                    .addInkWell(
                        color: Colors.white,
                        splash: AppColors.lightgreen,
                        onPress: onPress))
            .addBdRadius(18));
  }

  Widget bodyMedia() {
    void gallery() {
      print('galeri');
    }

    void camera() {
      print('kamera');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Jika sudah transfer, upload bukti transfer di sini:',
            style: AppTxtStyle.bLight(16)),
        AppStyle.yGapSm,
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              inkButton([
                SvgPicture.asset(Assets.galleryAdd),
                Text('Galeri', style: AppTxtStyle.gBold(18))
              ], () {
                gallery();
              }),
              inkButton([
                SvgPicture.asset(Assets.cameraAdd),
                Text('kamera', style: AppTxtStyle.gBold(18))
              ], () {
                camera();
              })
            ]).addBorder(color: AppColors.primary, radius: 18)
      ],
    );
  }

  Widget bodyUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(Assets.bukti)
            .addBdRadius(18)
            .addBorder(color: AppColors.primary, radius: 18),
        AppStyle.yGapSm,
        Center(
            child: ElevatedButton(
                onPressed: () {},
                style: AppBtnStyle.elevGreenSm,
                child: Text('Upload Gambar', style: AppTxtStyle.wRegular(18))))
      ],
    );
  }

  Widget contentTile(BuildContext context,
      {required List<Widget> colWidget1, required List<Widget> colWidget2}) {
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
              onSelected: (MenuPopup item) async {
                switch (item.name) {
                  case 'secondItem':
                    await openSheet(context, colWidget2);
                  default:
                    await openSheet(context, colWidget1);
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
