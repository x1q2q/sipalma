import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/routing/app_router.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/application/profile/profile_service.dart';
import 'profile_controller.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  // using textEditingController in consumerState instead of in provider(service/controller) cause its recommendation based on documentation
  int? idUser;
  final emailCtrlr = TextEditingController();
  final nameCtrlr = TextEditingController();
  final pwdCtrlr = TextEditingController();
  final addrCtrlr = TextEditingController();

  @override
  void initState() {
    super.initState();
    final profileAsyncValue = ref.read(fetchProfileProvider).value!;
    idUser = profileAsyncValue.id;
    emailCtrlr.text = profileAsyncValue.email;
    nameCtrlr.text = profileAsyncValue.name;
    addrCtrlr.text = profileAsyncValue.address;
  }

  @override
  void dispose() {
    emailCtrlr.dispose();
    nameCtrlr.dispose();
    pwdCtrlr.dispose();
    addrCtrlr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(profileControllerProvider, (_, state) {
      // state.showSnackbar(context, 'Berhasil mengupdate data profil');
    });
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
                    fieldButton(context, ref),
                  ]))).addRefresher(
              bgColor: AppColors.primary,
              onRefresh: () async {
                ref.refresh(fetchProfileProvider);
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
                  txtController: nameCtrlr,
                  placeholder: 'nama lengkap'),
              FieldInput(
                fieldLabel: 'Alamat',
                txtController: addrCtrlr,
                placeholder: 'alamat',
                lines: 3,
                type: TextInputType.streetAddress,
              ),
            ]));
  }

  Widget fieldButton(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> data = {
      'id': idUser,
      'name': nameCtrlr.text,
      'email': emailCtrlr.text,
      'password': pwdCtrlr.text,
      'address': addrCtrlr.text
    };
    final updateState = ref.watch(profileControllerProvider);

    return Center(
            child: PrimaryButton(
                icon: Text('Simpan', style: AppTxtStyle.wRegular(18)),
                label: SvgPicture.asset(Assets.save),
                isLoading: updateState.isLoading,
                btnStyle: AppBtnStyle.elevGreenMd,
                onPressed: updateState.isLoading
                    ? null
                    : () {
                        ref
                            .read(profileControllerProvider.notifier)
                            .updateData(data)
                            .then((stateError) {
                          if (stateError) {
                            String errorObj = (updateState.error != null)
                                ? updateState.error.toString()
                                : 'Server internal error';
                            UIHelper.notifToast(
                                context, errorObj, AppColors.red);
                          } else {
                            UIHelper.notifToast(
                                context,
                                'Berhasil mengupdate data profil',
                                AppColors.green);
                            context.goNamed(AppRoutes.home.name);
                          }
                        });
                      }))
        .addPd(y: 15);
  }
}
