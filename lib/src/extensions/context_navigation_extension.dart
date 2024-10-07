import 'package:flutter/material.dart';

extension ContextNavigationExt on BuildContext {
  /// Navigates to the given [screen] and returns a [Future] that completes with the value returned by the route.
  ///
  /// The [screen] parameter is a [Widget] that represents the screen to navigate to.
  Future<T?> push<T>(
    final Widget screen, {
    final String? routeName,
  }) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  /// Navigates to the given [screen] and removes the current routes from the navigator.
  ///
  /// The [screen] parameter is a [Widget] that represents the screen to navigate to.
  Future<T?> pushReplacement<T>(
    final Widget screen, {
    final bool fullscreenDialog = false,
  }) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (_) => screen,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  /// Pushes the named route onto the navigator stack and returns a future that completes when the route is popped.
  ///
  /// The `route` parameter is the name of the route to push.
  /// The `arguments` parameter is an optional argument to pass to the pushed route.
  Future<T?> pushNamed<T>(
    final String route, {
    final dynamic arguments,
  }) {
    return Navigator.of(this).pushNamed<T>(
      route,
      arguments: arguments,
    );
  }

  /// Pushes the named route onto the navigator stack and removes all the previous routes until the predicate returns true.
  ///
  /// The `route` parameter is the name of the route to push.
  /// The `arguments` parameter is an optional argument to pass to the pushed route.
  Future<T?> pushNamedAndRemoveUntil<T>(
    final String route, {
    final dynamic arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      route,
      (r) => route == r.settings.name,
      arguments: arguments,
    );
  }

  /// Pushes the route onto the navigator stack and removes all the previous routes until the predicate returns true.
  ///
  /// The `screen` parameter is the name of the screen to push.
  Future<T?> pushAndRemoveUntil<T>(
    final Widget screen, {
    final String? routeName,
  }) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(name: routeName),
      ),
      (r) => false,
    );
  }

  /// Removes the current route from the navigator and returns the value that was passed to [Navigator.pop] when the route was pushed onto the navigator.
  ///
  /// The `argument` parameter is an optional value to return as the result of the route.
  void pop<T>({
    final T? argument,
  }) {
    Navigator.of(this).pop<T>(argument);
  }

  void popUntil<T>({
    required bool Function(Route<dynamic>) predicate,
  }) {
    Navigator.of(this).popUntil(predicate);
  }

  /// If the navigator can be popped, removes the current route from the navigator and returns the value that was passed to [Navigator.pop] when the route was pushed onto the navigator.
  ///
  /// The `argument` parameter is an optional value to return as the result of the route.
  void maybePop<T>({
    final T? argument,
  }) {
    Navigator.of(this).maybePop<T>(argument);
  }

  /// Checks if the navigator can be popped or not.
  bool canPop() {
    return Navigator.of(this).canPop();
  }
}
