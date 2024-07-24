import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/routing/app_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailCtrlr = TextEditingController();
    final TextEditingController pwdCtrlr = TextEditingController();

    return Scaffold(body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AppStyle.yGapLg,
                    Center(
                        child: Image.asset(Assets.logoAuth,
                                width: 120, height: 120)
                            .addPd(all: 30)
                            .addInkWell(color: AppColors.lightgray)
                            .addBdRadius(100)),
                    AppStyle.yGapMd,
                    Text('Selamat Datang di Sipalma!',
                        style: AppTxtStyle.gBold(20),
                        textAlign: TextAlign.center),
                    Text('Silahkan masuk ke akun anda',
                        style: AppTxtStyle.gLight(16),
                        textAlign: TextAlign.center),
                    AppStyle.yGapMd,
                    FieldInput(
                        fieldLabel: 'Email',
                        txtController: emailCtrlr,
                        type: TextInputType.emailAddress,
                        placeholder: 'your@mail.com'),
                    FieldInput(
                        fieldLabel: 'Password',
                        txtController: pwdCtrlr,
                        placeholder: '***************',
                        isObscure: true,
                        type: TextInputType.visiblePassword),
                    AppStyle.yGapSm,
                    ElevatedButton(
                        onPressed: () {
                          context.goNamed(AppRoutes.home.name);
                        },
                        style: AppBtnStyle.elevGreenMd,
                        child: Text('Masuk', style: AppTxtStyle.wBold(20)))
                  ]).addPd(all: 15)));
    })));
  }
}
