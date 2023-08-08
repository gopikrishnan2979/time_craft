import 'package:flutter/material.dart';


// quantity controller for controlling the quantity of the item for ordering and for adding to the cart
class QtyController extends ChangeNotifier {
  int qty = 1;

  //---------------incrementing function for increase the quantity
  incrementQty() {
    qty++;
    notifyListeners();
  }

  //---------------decrementing fuction for decrease the quantity
  decrementQty() {
    if (qty > 1) {
      qty--;
      notifyListeners();
    }
  }
}
