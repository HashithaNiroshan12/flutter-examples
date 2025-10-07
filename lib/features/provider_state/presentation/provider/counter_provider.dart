import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counterValue;

  CounterProvider({
    this.counterValue = 0,
  });

  void increment() {
    counterValue++;
    notifyListeners();
  }

  void decrement() {
    counterValue--;
    notifyListeners();
  }
}
