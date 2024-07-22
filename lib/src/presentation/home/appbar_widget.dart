import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String appName;

  const AppbarWidget(
      {super.key, required this.userName, required this.appName});
  final double hNavbar = 70;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(hNavbar),
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
          decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Hello!', style: AppTxtStyle.wRegular(13)),
                      Text(userName, style: AppTxtStyle.wRegular(15))
                    ]),
                Text(appName, style: AppTxtStyle.wTitleNav)
              ]),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(hNavbar);
}
