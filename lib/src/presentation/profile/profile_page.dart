import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/routing/app_router.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'package:sipalma/src/application/profile/profile_service.dart';
import 'package:sipalma/src/domain/profile/profile.dart';
import 'profile_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsyncValue = ref.watch(fetchProfileProvider);

    return Scaffold(
        appBar: AppBar(title: Text('Profil', style: AppTxtStyle.wTitleNav)),
        backgroundColor: AppColors.lightgray,
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return switch (profileAsyncValue) {
            AsyncData(:final value) => SingleChildScrollView(
                physics: const PageScrollPhysics(),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight),
                    child: Column(children: <Widget>[
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 25),
                        height: 240.0,
                        alignment: Alignment.center,
                        child: headerProfile(context, value),
                      ),
                      listFieldUser(context, value),
                      fieldButton(context, value, ref),
                    ]))).addRefresher(
                bgColor: AppColors.primary,
                onRefresh: () async {
                  ref.refresh(fetchProfileProvider);
                }),
            AsyncError(:final error) => Text('Error: ${error.toString()}',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.red)),
            _ => AppShimmer.shimmerListProfile,
          };
        })));
  }

  Widget headerProfile(BuildContext context, Profile item) {
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

  Widget listFieldUser(BuildContext context, Profile item) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 18),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppStyle.yGapXs,
              profilFieldCard('Email', item.email),
              AppStyle.yGapSm,
              profilFieldCard('Nama Lengkap', item.name),
              AppStyle.yGapSm,
              profilFieldCard('Alamat', item.address, isColumn: true),
              AppStyle.yGapXs
            ]));
  }

  Widget fieldButton(BuildContext context, Profile item, WidgetRef ref) {
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
                      onPressed: () async {
                        ref.read(profileControllerProvider.notifier).logout();
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
