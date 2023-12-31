import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExt on Widget {
  Widget onPressed(final Function()? onPressed) => GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onPressedDown(final Function(TapDownDetails)? onPressed) =>
      GestureDetector(
        onTapDown: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onPressedUp(final Function(TapUpDetails)? onPressed) =>
      GestureDetector(
        onTapUp: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onLongPressed(final Function()? onLongPressed) => GestureDetector(
        onLongPress: onLongPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );

  Widget pX(double val) => Padding(
        padding: EdgeInsets.symmetric(horizontal: val.w),
        child: this,
      );

  Widget pY(double val) => Padding(
        padding: EdgeInsets.symmetric(vertical: val.h),
        child: this,
      );

  Widget pXY(double x, double y) => Padding(
        padding: EdgeInsets.symmetric(vertical: y.h, horizontal: x.w),
        child: this,
      );

  Widget pT(double val) => Padding(
        padding: EdgeInsets.only(top: val.h),
        child: this,
      );

  Widget pL(double val) => Padding(
        padding: EdgeInsets.only(left: val.w),
        child: this,
      );

  Widget pR(double val) => Padding(
        padding: EdgeInsets.only(right: val.w),
        child: this,
      );

  Widget pB(double val) => Padding(
        padding: EdgeInsets.only(bottom: val.h),
        child: this,
      );

  Widget pNT(double val) => Padding(
        padding: EdgeInsets.only(
          bottom: val.h,
          left: val.w,
          right: val.w,
        ),
        child: this,
      );

  Widget pNL(double val) => Padding(
        padding: EdgeInsets.only(
          top: val.h,
          bottom: val.h,
          right: val.w,
        ),
        child: this,
      );

  Widget pNR(double val) => Padding(
        padding: EdgeInsets.only(
          top: val.h,
          bottom: val.h,
          left: val.w,
        ),
        child: this,
      );

  Widget pNB(double val) => Padding(
        padding: EdgeInsets.only(
          top: val.h,
          left: val.w,
          right: val.w,
        ),
        child: this,
      );

  Widget pad(double val) => Padding(
        padding: EdgeInsets.all(val.w),
        child: this,
      );

  Widget toSliverBox() => SliverToBoxAdapter(
        key: key,
        child: this,
      );

  Widget toSizedBox({
    final double? width,
    final double? height,
  }) =>
      SizedBox(
        key: key,
        width: width?.w,
        height: height?.h,
        child: Center(child: this),
      );
}
