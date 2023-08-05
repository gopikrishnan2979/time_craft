import 'package:flutter/material.dart';

class PaymentSelector extends ChangeNotifier {
  bool israzorpay = true;
  void selectedrazorpay() {
    israzorpay = true;
    notifyListeners();
  }

  void selectedcod() {
    israzorpay = false;
    notifyListeners();
  }
  
}
