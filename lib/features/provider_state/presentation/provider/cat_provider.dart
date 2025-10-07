import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier {
  String catName = "Cat Provider";

  String get name => catName;

  set name(String newname) {
    catName = newname;
    notifyListeners();
  }
}
