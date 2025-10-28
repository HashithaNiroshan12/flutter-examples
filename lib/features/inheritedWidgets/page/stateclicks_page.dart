import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/inheritedWidgets/widget/inherited_click_page.dart';

class StateClicks extends StatefulWidget {
  final Widget child;
  const StateClicks({Key? key, required this.child}) : super(key: key);

  @override
  State<StateClicks> createState() => _StateClicksState();
}

class _StateClicksState extends State<StateClicks> {
  int clicks = 0;

  void incrementClciks() {
    setState(() {
      clicks += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedClicks(clicks: clicks, child: widget.child);
  }
}
