import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void addItem() {
    _count++;
    notifyListeners();
  }
}
