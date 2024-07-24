import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sipalma/src/routing/app_router.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'package:sipalma/src/res/widgets/index.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Edit Profil', style: AppTxtStyle.wTitleNav)),
        backgroundColor: AppColors.lightgray,
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              physics: const PageScrollPhysics(),
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      height: 180.0,
                      alignment: Alignment.center,
                      child: headerProfile(context),
                    ),
                    listFieldUser(context),
                    fieldButton(context),
                  ]))).addRefresher(
              bgColor: AppColors.primary,
              onRefresh: () async {
                print('seger');
              });
        })));
  }

  Widget headerProfile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[Image.asset(Assets.profile, height: 120)],
    );
  }

  Widget listFieldUser(BuildContext context) {
    final TextEditingController emailCtrlr = TextEditingController();
    final TextEditingController pwdCtrlr = TextEditingController();
    final TextEditingController fnameCtrlr = TextEditingController();
    final TextEditingController addressCtrlr = TextEditingController();
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 18),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FieldInput(
                  fieldLabel: 'Email',
                  txtController: emailCtrlr,
                  type: TextInputType.emailAddress,
                  placeholder: 'your@mail.com'),
              FieldInput(
                  fieldLabel: 'Password Baru',
                  txtController: pwdCtrlr,
                  placeholder: '(kosongkan jika tidak ingin diubah)',
                  isObscure: true,
                  type: TextInputType.visiblePassword),
              FieldInput(
                  fieldLabel: 'Nama Lengkap',
                  txtController: fnameCtrlr,
                  placeholder: 'nama lengkap'),
              FieldInput(
                fieldLabel: 'Alamat',
                txtController: addressCtrlr,
                placeholder: 'alamat',
                lines: 3,
                type: TextInputType.streetAddress,
              ),
            ]));
  }

  Widget fieldButton(BuildContext context) {
    return Center(
        child: ElevatedButton.icon(
      label: SvgPicture.asset(Assets.save),
      icon: Text('Simpan', style: AppTxtStyle.wRegular(18)),
      style: AppBtnStyle.elevGreenMd,
      onPressed: () {
        context.goNamed(AppRoutes.home.name);
      },
    )).addPd(y: 15);
  }
}
