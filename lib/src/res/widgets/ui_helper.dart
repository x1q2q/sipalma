import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/widgets/app_dialog_cancel.dart';

class UIHelper {
  UIHelper._();
  static Widget loading({Color? color, double? width, double? height}) {
    return SizedBox(
      width: width ?? 80,
      height: height ?? 80,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.green),
        ),
      ),
    );
  }

  static Future<bool?> modalSheet(
      {required BuildContext context, required Widget child}) async {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
        context: context,
        builder: (BuildContext context) => SafeArea(child: child));
  }

  static Future<bool?> modalDialog(
      {required BuildContext context,
      required String content,
      required String title,
      required List<Widget> colWidget}) async {
    return showDialog(
      context: context,
      builder: (context) => AppDialogCancel(
          title: title, contentText: content, colWidget: colWidget),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> rawToast(
      BuildContext context, String message) {
    final snackBarContent = SnackBar(
      content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(message, style: AppTxtStyle.wRegular(14))]),
      backgroundColor: AppColors.black,
      behavior: SnackBarBehavior.fixed,
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBarContent);
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> notifToast(
      BuildContext context, String message, Color bgColor) {
    final snackBarContent = SnackBar(
        showCloseIcon: true,
        duration: const Duration(milliseconds: 5000),
        content:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          const Icon(Icons.info_outline, color: Colors.white),
          const SizedBox(width: 4.0),
          Expanded(
              child: Text(message,
                  style: AppTxtStyle.wRegular(15),
                  overflow: TextOverflow.ellipsis))
        ]),
        backgroundColor: bgColor,
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 40, right: 20, left: 20));
    return ScaffoldMessenger.of(context).showSnackBar(snackBarContent);
  }
}
