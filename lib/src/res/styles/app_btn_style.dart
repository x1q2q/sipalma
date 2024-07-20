import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppBtnStyle {
  static ButtonStyle btnOutlineCancel = OutlinedButton.styleFrom(
    side: const BorderSide(width: 1, color: AppColors.primary),
    minimumSize: const Size(70, 40),
    backgroundColor: AppColors.primary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
  static ButtonStyle btnSmElevatedPurple = ElevatedButton.styleFrom(
    minimumSize: const Size(70, 40),
    foregroundColor: Colors.white,
    backgroundColor: AppColors.secondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}
