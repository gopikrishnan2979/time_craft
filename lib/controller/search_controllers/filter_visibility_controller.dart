import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

// Filter controlling for enabling and disabling the filter in the app
class VisibilityController extends ChangeNotifier {
  bool isexpanded = false;
  double visibilityHeight = 0;
  //make the filter visible and invisible 
  change({required bool value}) {
    isexpanded = value;
    if (isexpanded) {
      visibilityHeight = khieght * 0.06;
    } else {
      visibilityHeight = 0;
    }
    notifyListeners();
  }
 
}
