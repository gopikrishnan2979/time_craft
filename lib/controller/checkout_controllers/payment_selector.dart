import 'package:flutter/material.dart';

// payment controllers which provide the switching of the payment method
class PaymentSelector extends ChangeNotifier {
  bool israzorpay = true;

//as there are only two methods i am using bool variable for reducing the space complexity
// this fuction helps to set the selected payment method;
  void selectedrazorpay() {
    israzorpay = true;
    notifyListeners();
  }

  void selectedcod() {
    israzorpay = false;
    notifyListeners();
  }
}
