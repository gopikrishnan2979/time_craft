import 'package:flutter/material.dart';
import 'package:time_craft/model/address_model.dart';

class CheckoutAddControl extends ChangeNotifier {
  AddressModel? address;
  setter({required AddressModel initAddress}) {
    address = initAddress;
    notifyListeners();
  }
}
