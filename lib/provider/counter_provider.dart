import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier{
  var _count = 0;
  int get counter => _count;

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}