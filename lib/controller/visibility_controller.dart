import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

class VisibilityController extends ChangeNotifier {
  bool isexpanded = false;
  double visibilityHeight = 0;
  change({required int gridcount,required bool value}) {
    isexpanded = value;
    if (isexpanded) {
      visibilityHeight = khieght * 0.13 * gridcount;
    } else {
      visibilityHeight = 0;
    }
    notifyListeners();
  }
}
