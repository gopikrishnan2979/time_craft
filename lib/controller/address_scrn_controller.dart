import 'package:flutter/material.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/model/firebase_instance_model.dart';

class AddressScrnController extends ChangeNotifier {
  List<AddressModel> addressList = [];
  int? selectedIndex;
  getAddressList() async {
    try {
      List data = await FirebaseInstances.address.get().then((value) => value.docs);
      addressList.clear();
      for (var element in data) {
        AddressModel address = AddressModel.fromData(data: element);
        addressList.add(address);
      }
      if (addressList.isNotEmpty) {
        selectedIndex = 0;
      }
      notifyListeners();
    } catch (e) {
      return;
    }
  }

  changeSelected({required int newindex}) {
    selectedIndex = newindex;
    notifyListeners();
  }
}
