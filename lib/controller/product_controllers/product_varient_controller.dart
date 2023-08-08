import 'package:flutter/material.dart';


// Varient controller for selecting the varient of a product
class VarientController extends ChangeNotifier {
  int selectedIdx = 0;
  //method will help in changing the selected varient of the product
  changeindex(int index,) {
    selectedIdx = index;
    notifyListeners();
  }
}
