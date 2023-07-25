import 'package:flutter/material.dart';

class VarientController extends ChangeNotifier {
  int selectedIdx = 0;
  changeindex(int index,) {
    selectedIdx = index;
    notifyListeners();
  }
}
