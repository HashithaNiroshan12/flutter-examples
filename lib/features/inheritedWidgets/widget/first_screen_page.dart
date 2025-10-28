import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/inheritedWidgets/widget/my_inhertiance_widget.dart';
import 'package:version_3_22_8/features/inheritedWidgets/widget/second_screen_page.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(MyInheritedWidget.of(context).message),
          onPressed: () {
            Navigator.of(context)
                   // navigate to second screen
                .push(MaterialPageRoute(builder: (_) => const MySecondScreen())); 
          },
        ),
      ),
    );
  }
}
