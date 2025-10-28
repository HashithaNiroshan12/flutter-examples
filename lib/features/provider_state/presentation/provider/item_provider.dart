import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/provider_state/presentation/domain/item.dart';

class ItemData with ChangeNotifier {
  List<Item> items = [];
  UnmodifiableListView<Item> get newitems => UnmodifiableListView(items);

  get size => newitems.length;

  void addItem(Item item) {
    newitems.add(item);
    notifyListeners();
  }

  void toggleItem(Item item) {
    item.toggle();
    notifyListeners();
  }

  void removeItem(Item item) {
    newitems.remove(item);
    notifyListeners();
  }
}
