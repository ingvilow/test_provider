import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int get counter => _count;
  var _count = 0;

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}
