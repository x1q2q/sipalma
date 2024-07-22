import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sipalma/src/routing/app_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Profil')),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            const Center(child: Text('profile page')),
            ElevatedButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.editProfile.name);
                },
                child: const Text('go to edit profile')),
          ],
        )));
  }
}
