import 'package:flutter/material.dart';
import 'package:sipalma/src/utils/extensions.dart';

class AppBottomsheet extends StatelessWidget {
  final List<Widget> colWidget;
  const AppBottomsheet({super.key, required this.colWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: MediaQuery.of(context).size.width,
      child: Wrap(alignment: WrapAlignment.center, children: [
        Container(
          width: 60,
          height: 6,
          color: Colors.grey[200],
        ).addBdRadius(30),
        ...colWidget
      ]),
    );
  }
}
