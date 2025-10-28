import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/inheritedWidgets/widget/inherited_click_page.dart';

class BlueSquare extends StatelessWidget {
  final double size;
  const BlueSquare({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int clicks = InheritedClicks.of(context);

    return GestureDetector(
      onTap: (){},
      child: Container(
        height: size,
        width: size,
        color: Colors.blue,
        child: Text("$clicks"),
      ),
    );
  }
}
