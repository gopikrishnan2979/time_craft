import 'package:flutter/material.dart';

class QtyController extends ChangeNotifier {
  int qty = 1;
  incrementQty() {
    qty++;
    notifyListeners();
  }

  decrementQty() {
    if (qty > 1) {
      qty--;
      notifyListeners();
    }
  }
}
