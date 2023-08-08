import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';

// Address service 
class AddressService {
  BuildContext context;
  AddressService({required this.context});
  addAddress({required AddressModel address}) async {
    try {
      await FirebaseInstances.address.add({
        'localAddress': address.localAddress,
        'city': address.city,
        'district': address.district,
        'state': address.state,
        'pincode': address.pincode,
        'landmark': address.landmark,
      }).then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBarDesign(text: 'Address added successfully'));
      });
    } on FirebaseException catch (e) {
      alertshower(context: context, text: e.message);
    }
  }
}
