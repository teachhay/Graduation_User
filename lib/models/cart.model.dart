import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  int counter = 0;

  int get getCounter {
    return counter;
  }

  void increase() {
    counter++;
    notifyListeners();
  }

  void reset() {
    counter = 0;
    notifyListeners();
  }
}
