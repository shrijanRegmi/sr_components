import 'package:flutter/material.dart';
import 'package:sr_components/sr_components.dart';

class SRRoundIconButton extends StatelessWidget {
  const SRRoundIconButton({
    Key? key,
    required this.icon,
    this.overlayWidget,
    this.bgColor,
    this.border,
    this.padding,
    this.shadow,
    this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final Widget? overlayWidget;
  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final BoxShadow? shadow;
  final BoxBorder? border;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor ?? SRColors.extraLightGrey.withOpacity(0.2),
                border: border,
                boxShadow: [
                  shadow ??
                      const BoxShadow(
                        color: Colors.transparent,
                      )
                ],
              ),
              padding: padding ?? const EdgeInsets.all(12.0),
              child: icon,
            ),
            Positioned(
              right: -2.0,
              top: -9.0,
              child: overlayWidget ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
