import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sipalma/src/routing/app_router.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';

class GridmenuWidget extends StatelessWidget {
  const GridmenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return GridView.count(
          childAspectRatio: 1.12,
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: <Widget>[
            menuCard(() => context.pushNamed(AppRoutes.announcement.name),
                'Pengumuman', Assets.announcement),
            menuCard(() => context.pushNamed(AppRoutes.billing.name), 'Tagihan',
                Assets.bill),
            menuCard(() => context.pushNamed(AppRoutes.payment.name),
                'Pembayaran', Assets.payment),
            menuCard(() => context.pushNamed(AppRoutes.profile.name), 'Profil',
                Assets.profile)
          ]);
    });
  }

  Widget menuCard(void Function()? onTap, String teks, String pathIcon) {
    return SizedBox.fromSize(
        child: Material(
            color: AppColors.lightgreen,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
                onTap: onTap,
                splashColor: AppColors.green,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.green),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(pathIcon, width: 110),
                        Text(teks, style: AppTxtStyle.gMenuCard)
                      ],
                    )))));
  }
}
