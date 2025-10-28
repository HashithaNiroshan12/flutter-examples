import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final String message;
  final Widget childWidget;

  const MyInheritedWidget(
      {Key? key, required this.childWidget, required this.message})
      : super(key: key, child: childWidget);

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.message != message;
  }
}
