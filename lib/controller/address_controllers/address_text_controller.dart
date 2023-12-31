import 'package:flutter/material.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/services/firebase/address.dart';
// a controller class which is used to control the data in the textfield of the address class so that it can be stateless
class AddressTextController extends ChangeNotifier {

  final TextEditingController localAddressCon = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController districtController = TextEditingController();

  final TextEditingController stateController = TextEditingController();

  final TextEditingController pinController = TextEditingController();

  final TextEditingController landmark = TextEditingController();

// this function helps to post the newly entered address to the database as the user is saved 
  Future<String?>addressAdding() async{
    AddressModel address = AddressModel(
        localAddress: localAddressCon.text.trim(),
        city: cityController.text.trim(),
        district: districtController.text.trim(),
        state: stateController.text.trim(),
        pincode: pinController.text.trim(),
        landmark: landmark.text.trim()==''?'no landmark':landmark.text.trim());
    return await AddressService().addAddress(address: address);
    
  }
}
