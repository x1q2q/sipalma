import 'package:flutter/material.dart';

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
}
