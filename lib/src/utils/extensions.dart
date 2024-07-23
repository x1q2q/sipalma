import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  Widget addMrg(
      {double? l,
      double? r,
      double? t,
      double? b,
      double? x,
      double? y,
      double? all}) {
    final margin = EdgeInsets.only(
      left: all ?? x ?? l ?? 0,
      right: all ?? x ?? r ?? 0,
      top: all ?? y ?? t ?? 0,
      bottom: all ?? y ?? b ?? 0,
    );
    return Container(
      margin: margin,
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
}
