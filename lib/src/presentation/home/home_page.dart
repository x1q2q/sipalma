import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sipalma/src/routing/app_router.dart';
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
                child: gridCustom(context))));
  }

  Widget gridCustom(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Text("He'd have you all unravel at the"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Text("He'd have you all unravel at the"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Text("He'd have you all unravel at the"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Text("He'd have you all unravel at the"),
          ),
        ]);
    // return Column(children: <Widget>[
    //   ElevatedButton(
    //       onPressed: () {
    //         context.pushNamed(AppRoutes.announcement.name);
    //       },
    //       child: const Text('go to announcement')),
    //   ElevatedButton(
    //       onPressed: () {
    //         context.pushNamed(AppRoutes.billing.name);
    //       },
    //       child: const Text('go to billing')),
    //   ElevatedButton(
    //       onPressed: () {
    //         context.pushNamed(AppRoutes.payment.name);
    //       },
    //       child: const Text('go to payment')),
    //   ElevatedButton(
    //       onPressed: () {
    //         context.pushNamed(AppRoutes.profile.name);
    //       },
    //       child: const Text('go to profile')),
    // ]);
  }
}
