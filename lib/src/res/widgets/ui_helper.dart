import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

class UIHelper {
  UIHelper._();
  static BoxShadow defaultBoxShadow = const BoxShadow(
    offset: Offset(3, 3),
    blurRadius: 5,
    spreadRadius: 2,
    color: Colors.white38,
  );

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
