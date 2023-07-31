import 'package:flutter/material.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/services/firebase/address.dart';

class AddressTextController extends ChangeNotifier {
  final TextEditingController localAddressCon = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController districtController = TextEditingController();

  final TextEditingController stateController = TextEditingController();

  final TextEditingController pinController = TextEditingController();

  final TextEditingController landmark = TextEditingController();

  addressAdding(BuildContext context) async{
    AddressModel address = AddressModel(
        localAddress: localAddressCon.text.trim(),
        city: cityController.text.trim(),
        district: districtController.text.trim(),
        state: stateController.text.trim(),
        pincode: pinController.text.trim(),
        landmark: landmark.text.trim()==''?'no landmark':landmark.text.trim());
    await AddressService(context: context).addAddress(address: address);
  }
}
