import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String appName;
  const AppbarWidget(
      {super.key, required this.userName, required this.appName});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[const Text('Hello!'), Text(userName)]),
                Text(appName)
              ]),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
