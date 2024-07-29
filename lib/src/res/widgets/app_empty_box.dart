import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/utils/extensions.dart';

class AppEmptyBox extends StatelessWidget {
  final Future<void> Function() onRefresh;
  const AppEmptyBox({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AppStyle.yGapLg,
        SvgPicture.asset(Assets.emptyBox, width: 90, height: 90)
            .addPd(y: 20, x: 30)
            .addInkWell(color: AppColors.lightgray)
            .addBdRadius(120),
        AppStyle.yGapSm,
        Text('Oops, data kosong!', style: AppTxtStyle.gBold(21)),
        AppStyle.yGapSm,
        Text('Nampaknya, sekarang data masih kosong. \nCoba untuk refresh',
            style: AppTxtStyle.gLight(15), textAlign: TextAlign.center),
        AppStyle.yGapSm,
        PrimaryButton(
          onPressed: onRefresh,
          btnStyle: AppBtnStyle.elevGreenMd,
          icon: Text('Refresh', style: AppTxtStyle.wRegular(20)),
          label: Icon(Icons.refresh),
        ),
        AppStyle.yGapLg,
      ],
    ));
  }
}
