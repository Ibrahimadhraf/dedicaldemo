import 'package:flutter/material.dart';

class BottomNavViewModel extends ChangeNotifier {
  var index = 0;

  changeTab(int i) {
    index = i;
    notifyListeners();
  }
}
