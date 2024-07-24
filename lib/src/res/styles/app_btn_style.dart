import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppBtnStyle {
  AppBtnStyle._();
  static ButtonStyle btnOutline(String tipe, Color color, {Color? foreground}) {
    return OutlinedButton.styleFrom(
      side: BorderSide(width: 1, color: color),
      minimumSize: (tipe == 'md') ? const Size(80, 50) : const Size(70, 40),
      foregroundColor: foreground,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  static ButtonStyle btnElevated(String tipe, Color color) {
    return ElevatedButton.styleFrom(
      minimumSize: (tipe == 'md') ? const Size(80, 50) : const Size(70, 40),
      foregroundColor: Colors.white,
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  static ButtonStyle elevGreenMd =
      AppBtnStyle.btnElevated('md', AppColors.primary);
  static ButtonStyle elevGreenSm =
      AppBtnStyle.btnElevated('sm', AppColors.primary);
  static ButtonStyle outlineGreenSm =
      AppBtnStyle.btnOutline('sm', AppColors.primary);
  static ButtonStyle outlineRedSm =
      AppBtnStyle.btnOutline('sm', AppColors.red, foreground: AppColors.red);
}
