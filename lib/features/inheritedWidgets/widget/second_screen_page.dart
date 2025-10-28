import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/inheritedWidgets/widget/my_inhertiance_widget.dart';

class MySecondScreen extends StatelessWidget {
  const MySecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
            "${MyInheritedWidget.of(context).message}\n This is Second Screen"),
      ),
    );
  }
}
