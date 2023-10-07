import 'package:flutter/material.dart';

class SRSpinner extends StatelessWidget {
  final Color? color;
  final double strokeWidth;
  final double size;

  const SRSpinner({
    super.key,
    this.color,
    this.strokeWidth = 1.2,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
