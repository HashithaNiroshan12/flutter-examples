import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/inheritedWidgets/widget/my_inhertiance_widget.dart';

class MyInheritedScreen extends StatelessWidget {
  const MyInheritedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Inherited Widget Screen'),
      ),
      body: MyInheritedWidget(
          childWidget: Builder(builder: (BuildContext innerContext) {
            return Center(
              child: Text(
                MyInheritedWidget.of(innerContext).message,
                style: const TextStyle(fontSize: 24),
              ),
            );
          }),
          message: "Hey there! I'm from Inherited Widget"),
    );
  }
}
