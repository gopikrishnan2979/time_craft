import 'package:flutter/material.dart';
import 'package:time_craft/model/address_model.dart';

class CheckoutAddControl extends ChangeNotifier {
  AddressModel? address;

  // address setter for the checkout screen as the user selected the address from the address list
  setter({required AddressModel initAddress}) {
    address = initAddress;
    notifyListeners();
  }
}
