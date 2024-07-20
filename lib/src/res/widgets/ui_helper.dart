import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/app_colors.dart';

class UIHelper {
  UIHelper._();
  static BoxShadow defaultBoxShadow = const BoxShadow(
    offset: Offset(3, 3),
    blurRadius: 5,
    spreadRadius: 2,
    color: Colors.white38,
  );
  static double setHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  static double setSp(double size) {
    return size.sp;
  }

  static double setWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  static Widget loading({Color? color, double? width, double? height}) {
    return SizedBox(
      width: width ?? UIHelper.setSp(80),
      height: height ?? UIHelper.setSp(80),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.green),
        ),
      ),
    );
  }

  static EdgeInsetsGeometry padSymmetric(
      {double? horizontal,
      double? vertical,
      double? cwTop,
      double? cwBottom,
      double? cwLeft,
      double? cwRight}) {
    return EdgeInsets.symmetric(
            vertical: UIHelper.setHeight(vertical ?? 0),
            horizontal: UIHelper.setWidth(horizontal ?? 0))
        .copyWith(
            top: cwTop ?? UIHelper.setHeight(vertical ?? 0),
            bottom: cwBottom ?? UIHelper.setHeight(vertical ?? 0),
            right: cwRight ?? UIHelper.setWidth(horizontal ?? 0),
            left: cwLeft ?? UIHelper.setWidth(horizontal ?? 0));
  }

  static EdgeInsetsGeometry padAll(double size,
      {double? cwTop, double? cwBottom, double? cwLeft, double? cwRight}) {
    return EdgeInsets.all(UIHelper.setHeight(size)).copyWith(
        top: cwTop ?? UIHelper.setHeight(size),
        bottom: cwBottom ?? UIHelper.setHeight(size),
        right: cwRight ?? UIHelper.setHeight(size),
        left: cwLeft ?? UIHelper.setHeight(size));
  }

  static EdgeInsetsGeometry padLTRB(
      double left, double top, double right, double bottom,
      {double? cwTop, double? cwBottom, double? cwLeft, double? cwRight}) {
    return EdgeInsets.fromLTRB(UIHelper.setWidth(left), UIHelper.setHeight(top),
            UIHelper.setWidth(right), UIHelper.setHeight(bottom))
        .copyWith(
            top: cwTop ?? UIHelper.setHeight(top),
            bottom: cwBottom ?? UIHelper.setHeight(bottom),
            right: cwRight ?? UIHelper.setWidth(right),
            left: cwLeft ?? UIHelper.setWidth(left));
  }
}
