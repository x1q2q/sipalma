import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Pengumuman',
                style: AppTxtStyle.wTitleNav)),
        body: const SafeArea(child: Center(child: Text('announcement page'))));
  }
}
