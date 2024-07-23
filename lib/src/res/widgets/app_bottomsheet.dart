import 'package:flutter/material.dart';
import 'package:sipalma/src/utils/extensions.dart';

class AppBottomsheet extends StatelessWidget {
  final double? height;
  final List<Widget> colWidget;
  const AppBottomsheet({super.key, this.height = 280, required this.colWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 6,
              color: Colors.grey[200],
            ).addBdRadius(20),
            ...colWidget
          ]),
    );
  }
}
