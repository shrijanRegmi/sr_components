import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExt on Widget {
  Widget onPressed(final Function()? onPressed) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPressed,
          behavior: HitTestBehavior.opaque,
          child: this,
        ),
      );
  Widget onPressedDown(final Function(TapDownDetails)? onPressed) =>
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTapDown: onPressed,
          behavior: HitTestBehavior.opaque,
          child: this,
        ),
      );
  Widget onPressedUp(final Function(TapUpDetails)? onPressed) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTapUp: onPressed,
          behavior: HitTestBehavior.opaque,
          child: this,
        ),
      );
  Widget onLongPressed(final Function()? onLongPressed) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onLongPress: onLongPressed,
          behavior: HitTestBehavior.opaque,
          child: this,
        ),
      );

  Widget pX(double val) => Padding(
        padding: EdgeInsets.symmetric(horizontal: val.spMin),
        child: this,
      );

  Widget pY(double val) => Padding(
        padding: EdgeInsets.symmetric(vertical: val.spMin),
        child: this,
      );

  Widget pXY(double x, double y) => Padding(
        padding: EdgeInsets.symmetric(vertical: y.spMin, horizontal: x.spMin),
        child: this,
      );

  Widget pT(double val) => Padding(
        padding: EdgeInsets.only(top: val.spMin),
        child: this,
      );

  Widget pL(double val) => Padding(
        padding: EdgeInsets.only(left: val.spMin),
        child: this,
      );

  Widget pR(double val) => Padding(
        padding: EdgeInsets.only(right: val.spMin),
        child: this,
      );

  Widget pB(double val) => Padding(
        padding: EdgeInsets.only(bottom: val.spMin),
        child: this,
      );

  Widget pNT(double val) => Padding(
        padding: EdgeInsets.only(
          bottom: val.spMin,
          left: val.spMin,
          right: val.spMin,
        ),
        child: this,
      );

  Widget pNL(double val) => Padding(
        padding: EdgeInsets.only(
          top: val.spMin,
          bottom: val.spMin,
          right: val.spMin,
        ),
        child: this,
      );

  Widget pNR(double val) => Padding(
        padding: EdgeInsets.only(
          top: val.spMin,
          bottom: val.spMin,
          left: val.spMin,
        ),
        child: this,
      );

  Widget pNB(double val) => Padding(
        padding: EdgeInsets.only(
          top: val.spMin,
          left: val.spMin,
          right: val.spMin,
        ),
        child: this,
      );

  Widget pad(double val) => Padding(
        padding: EdgeInsets.all(val.spMin),
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
        width: width?.spMin,
        height: height?.spMin,
        child: Center(child: this),
      );

  /// A wrapper that can be used to hide the scrollbar of a [ListView] or [SingleChildScrollView].
  Widget hideScrollbarWrap(
    final BuildContext context,
  ) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child: this,
    );
  }
}
