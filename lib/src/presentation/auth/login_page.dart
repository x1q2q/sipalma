import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/routing/app_router.dart';
import 'login_controller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailCtrlr = TextEditingController();
    final TextEditingController pwdCtrlr = TextEditingController();
    final updateState = ref.watch(loginControllerProvider);

    return GestureDetector(onTap: () {
      FocusManager.instance.primaryFocus?.unfocus();
    }, child: Scaffold(body: SafeArea(child: LayoutBuilder(
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
                    PrimaryButton(
                        icon: Text('Masuk', style: AppTxtStyle.wBold(20)),
                        label: const Icon(Icons.login),
                        isLoading: updateState.isLoading,
                        btnStyle: AppBtnStyle.elevGreenMd,
                        onPressed: updateState.isLoading
                            ? null
                            : () {
                                String email = emailCtrlr.text;
                                String password = pwdCtrlr.text;
                                if (email.isEmpty || password.isEmpty) {
                                  UIHelper.notifToast(
                                      context,
                                      'Username atau password masih kosong',
                                      Colors.orange);
                                } else {
                                  ref
                                      .read(loginControllerProvider.notifier)
                                      .submitLogin(email, password)
                                      .then((stateError) {
                                    if (stateError) {
                                      String errorObj =
                                          (updateState.error != null)
                                              ? updateState.error.toString()
                                              : 'Server internal error';
                                      UIHelper.notifToast(
                                          context, errorObj, AppColors.red);
                                    } else {
                                      UIHelper.notifToast(context,
                                          'Berhasil login', AppColors.green);
                                      context.goNamed(AppRoutes.home.name);
                                    }
                                  });
                                }
                              })
                  ]).addPd(all: 15)));
    }))));
  }
}
