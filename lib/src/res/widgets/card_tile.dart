import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/utils/extensions.dart';

class CardTile extends StatelessWidget {
  final double? height;
  final Function() onTap;
  final Widget widget;
  const CardTile(
      {super.key, this.height = 75, required this.onTap, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
            child: Container(
                    height: height,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: widget)
                .addInkWell(
                    color: AppColors.lightgray,
                    splash: AppColors.lightgreen,
                    onPress: onTap))
        .addBdRadius(18);
  }
}
