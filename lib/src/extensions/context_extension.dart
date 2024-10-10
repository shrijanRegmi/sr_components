import 'package:flutter/material.dart';

/// Contains extension methods for the [BuildContext] class.
extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Removes the focus from any currently focused input widgets.
  void unfocusInputs() {
    FocusScope.of(this).unfocus();
  }

  /// Requests focus for the given [FocusNode] or the current focus scope if no [FocusNode] is given.
  void requestFocusOnInputs({
    final FocusNode? focusNode,
  }) {
    FocusScope.of(this).requestFocus(focusNode);
  }
}
