import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/inheritedWidgets/widget/first_screen_page.dart';
import 'package:version_3_22_8/features/inheritedWidgets/widget/my_inhertiance_widget.dart';
import 'package:version_3_22_8/features/inheritedWidgets/widget/second_screen_page.dart';

class MyNavigationPage extends StatelessWidget {
  const MyNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
        childWidget: Navigator(
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case 'screen1':
                return generatePage(const FirstScreen());
              case 'screen2':
                return generatePage(const MySecondScreen());
              default:
            }
          },
          initialRoute: 'screen1',
        ),
        message: "Hello from MyNavigationPage");
  }
}

// route function for  Routing of pages
Route generatePage(child) {
  return MaterialPageRoute(builder: (context) => child);
}
