import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTxtStyle {
  AppTxtStyle._();
  static TextStyle wBold(double px) {
    return TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: px);
  }

  static TextStyle wRegular(double px) {
    return TextStyle(
        fontWeight: FontWeight.w400, color: Colors.white, fontSize: px);
  }

  static TextStyle gBold(double px) {
    return TextStyle(
        fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: px);
  }

  static TextStyle wTitleNav = AppTxtStyle.wBold(26);

  static TextStyle gMenuCard = AppTxtStyle.gBold(20);
}
