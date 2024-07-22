import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Edit Profil', style: AppTxtStyle.wTitleNav)),
        body: const SafeArea(child: Center(child: Text('edit profile page'))));
  }
}
