import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'gridmenu_widget.dart';
import 'appbar_widget.dart';
import 'home_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String name = ref.watch(homeControllerProvider.notifier).getActiveUser();
    return Scaffold(
        appBar: AppbarWidget(userName: name, appName: 'Sipalma'),
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
