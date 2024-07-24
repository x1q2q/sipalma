import 'package:flutter/material.dart';
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
}
