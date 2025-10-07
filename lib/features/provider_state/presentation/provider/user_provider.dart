import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String user = "User is not registerd";

  String get currentUser => user;

  set currentUsername(String newUser) {
    user = newUser;
    notifyListeners();
  }
}
