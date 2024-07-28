import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/res/widgets/ui_helper.dart';
import 'package:sipalma/src/res/styles/app_colors.dart';

extension StringExtensions on String {
  String toRupiah() {
    final formatter =
        NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0);
    return formatter.format(int.parse(this));
  }

  String toFormattedDate(String format) {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat(format, "id_ID").format(dateTime);
  }
}

extension WidgetHelpers on Widget {
  // all => all, l => left, t => top, r => right, b => bottom, x => horizontal, y => vertical
  Widget addPd(
      {double? l,
      double? r,
      double? t,
      double? b,
      double? x,
      double? y,
      double? all}) {
    final padding = EdgeInsets.only(
      left: all ?? x ?? l ?? 0,
      right: all ?? x ?? r ?? 0,
      top: all ?? y ?? t ?? 0,
      bottom: all ?? y ?? b ?? 0,
    );
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget addBdRadius(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }

  Widget addInkWell(
      {required Color color,
      Color? splash,
      double? elev,
      VoidCallback? onPress}) {
    return Material(
        color: color,
        elevation: elev ?? 0,
        child:
            InkWell(splashColor: splash, onTap: onPress ?? () {}, child: this));
  }

  Widget addRefresher(
      {required Color bgColor, required Future<void> Function() onRefresh}) {
    return RefreshIndicator(
        backgroundColor: bgColor,
        color: Colors.white,
        strokeWidth: 2.0,
        onRefresh: onRefresh,
        child: this);
  }

  Widget addBorder({required Color color, double? radius}) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(radius ?? 0)),
        child: this);
  }
}

typedef VoidAsyncValue = AsyncValue<void>;

extension AsyncValueUI on AsyncValue<void> {
  bool get isLoading => this is AsyncLoading<void>;

  void showSnackbar(BuildContext context, Function(void)? onSuccess) {
    whenOrNull(
      data: onSuccess,
      error: (e, stack) {
        UIHelper.notifToast(context, error.toString(), AppColors.red);
      },
    );
  }
}
