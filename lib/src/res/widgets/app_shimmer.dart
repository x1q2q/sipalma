import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sipalma/src/res/styles/index.dart';

class AppShimmer {
  AppShimmer._();
  static Widget baseContainer(double w, double h,
      {double radius = 10, int shadeGrey = 200}) {
    return Container(
        width: w,
        height: h,
        decoration: ShapeDecoration(
            color: Colors.grey[shadeGrey]!,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)))));
  }

  static Widget roundedContainer() {
    return SizedBox(
      width: 120,
      child: Container(
        height: 120,
        decoration: ShapeDecoration(
            color: Colors.grey[400]!, shape: const CircleBorder()),
      ),
    );
  }

  static Widget shimmerImg = Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade200,
      child: baseContainer(double.infinity, double.infinity));

  static Widget shimmerListView = Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: ListView.separated(
          itemCount: 6,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              AppStyle.yGapSm,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) {
            return baseContainer(double.infinity, 100, radius: 18);
          }));
  static Widget shimmerImgMd = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: baseContainer(160, 160));

  static Widget shimmerSpan = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: baseContainer(double.infinity, 20));

  static Widget shimmerBtn = Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: baseContainer(180, 36, radius: 30));

  static Widget shimmerProfil = Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Column(
        children: <Widget>[
          AppStyle.yGapSm,
          roundedContainer(),
          AppStyle.yGapSm,
          baseContainer(160, 26, radius: 18)
        ],
      ));

  static Widget shimmerListProfile = Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ListView.separated(
            itemCount: 6,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                AppStyle.yGapSm,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, i) {
              return baseContainer(double.infinity, 30, shadeGrey: 300);
            }),
      ));

  static Widget shimmerEditProfil = Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Column(
        children: <Widget>[
          AppStyle.yGapSm,
          roundedContainer(),
          AppStyle.yGapSm,
        ],
      ));
  static Widget bottomBar = Shimmer.fromColors(
      baseColor: Colors.red.shade200,
      highlightColor: Colors.red.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: baseContainer(double.infinity, 34, radius: 8)),
          const SizedBox(width: 10),
          Expanded(child: baseContainer(double.infinity, 34, radius: 8)),
        ],
      ));
}
