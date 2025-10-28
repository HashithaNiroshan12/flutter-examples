import 'package:flutter/material.dart';

class InheritedClicks extends InheritedWidget {
  final int clicks;
  const InheritedClicks({Key? key, required this.clicks, required Widget child})
      : super(key: key, child: child);

  static int of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedClicks>()!.clicks;

  @override
  bool updateShouldNotify(InheritedClicks oldWidget) {
    return clicks != oldWidget.clicks;
  }
}
