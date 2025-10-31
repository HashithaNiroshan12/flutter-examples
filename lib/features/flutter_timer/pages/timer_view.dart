import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/flutter_timer/widgets/background.dart';
import 'package:version_3_22_8/features/flutter_timer/widgets/timer_text.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Timer'),
      ),
      body: Stack(
        children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Center(
                  child: TimerText(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
