import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sipalma/src/res/styles/app_txt_style.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/routing/app_router.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profil', style: AppTxtStyle.wTitleNav)),
        backgroundColor: AppColors.lightgray,
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              physics: const PageScrollPhysics(),
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 25),
                      height: 240.0,
                      alignment: Alignment.center,
                      child: headerProfile(context),
                    ),
                    listFieldUser(context),
                    fieldButton(context),
                  ]))).addRefresher(
              bgColor: AppColors.primary,
              onRefresh: () async {
                print('seger');
              });
        })));
  }

  Widget headerProfile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(Assets.profile, height: 120),
        ElevatedButton.icon(
          icon: Text('Edit Profil', style: AppTxtStyle.wRegular(18)),
          label: SvgPicture.asset(Assets.editProfil),
          style: AppBtnStyle.elevGreenMd,
          onPressed: () {
            context.pushNamed(AppRoutes.editProfile.name);
          },
        ),
      ],
    );
  }

  Widget profilFieldCard(String textKey, String textVal,
      {bool isColumn = false}) {
    return SizedBox(
            child: !isColumn
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(textKey, style: AppTxtStyle.bBold(15))),
                      Flexible(
                          child: Text(textVal,
                              style: AppTxtStyle.bLight(15),
                              overflow: TextOverflow.ellipsis))
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(textKey, style: AppTxtStyle.bBold(15))),
                      Text(textVal,
                          style: AppTxtStyle.bLight(15),
                          textAlign: TextAlign.justify)
                    ],
                  ))
        .addPd(y: 15, x: 10)
        .addInkWell(color: AppColors.lightgray)
        .addBdRadius(8);
  }

  Widget listFieldUser(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 18),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppStyle.yGapXs,
              profilFieldCard('Email', 'bejosulistyo@gmail.com'),
              AppStyle.yGapSm,
              profilFieldCard('Nama Lengkap', 'Bejo Sulistyo Harahap'),
              AppStyle.yGapSm,
              profilFieldCard('Alamat', 'Jl. Desa Localhost:8080, Jawa Utara',
                  isColumn: true),
              AppStyle.yGapXs
            ]));
  }

  Widget fieldButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Row(children: <Widget>[
              SvgPicture.asset(Assets.logoutProfil),
              const SizedBox(width: 10),
              Text('Keluar Akun', style: AppTxtStyle.bBold(15))
            ])),
            Text('versi 0.1', style: AppTxtStyle.bLight(15))
          ],
        )
            .addPd(y: 15, x: 10)
            .addInkWell(
                color: AppColors.lightgray,
                onPress: () async {
                  List<Widget> colWidget = [
                    const SizedBox(width: 80),
                    TextButton(
                      child: Text('Batal', style: AppTxtStyle.gLight(14)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      style: AppBtnStyle.outlineRedSm,
                      onPressed: () {
                        print('telah logout');
                      },
                      child: Text('Ya, Keluar', style: AppTxtStyle.rLight(14)),
                    )
                  ];
                  await UIHelper.modalDialog(
                      context: context,
                      title: 'Keluar Akun',
                      content: 'Yakin, akan keluar akun?',
                      colWidget: colWidget);
                })
            .addBdRadius(8));
  }
}
