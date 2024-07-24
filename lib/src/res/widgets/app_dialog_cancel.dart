import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';

class AppDialogCancel extends StatelessWidget {
  final String title;
  final String contentText;
  final List<Widget> colWidget;
  const AppDialogCancel(
      {Key? key,
      required this.title,
      required this.contentText,
      required this.colWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Material(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(title, style: AppTxtStyle.gBold(18)),
                            AppStyle.yGapSm,
                            Text(
                              contentText,
                              style: AppTxtStyle.bLight(15),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18)),
                          color: AppColors.lightgray,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: colWidget,
                        ))
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
