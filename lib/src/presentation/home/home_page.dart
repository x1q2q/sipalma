import 'package:flutter/material.dart';
import 'gridmenu_widget.dart';
import 'appbar_widget.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            const AppbarWidget(userName: 'Bejo Sulistyo', appName: 'Sipalma'),
        body: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: svg_provider.Svg(Assets.patternSvg,
                          size: Size.square(10)),
                      repeat: ImageRepeat.repeat),
                ),
                height: double.infinity,
                width: double.infinity,
                child: const Center(child: GridmenuWidget()))));
  }
}
