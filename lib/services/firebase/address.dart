import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/model/firebase_instance_model.dart';

// Address service
class AddressService {
  Future<String?> addAddress({required AddressModel address}) async {
    try {
      return await FirebaseInstances.address.add({
        'localAddress': address.localAddress,
        'city': address.city,
        'district': address.district,
        'state': address.state,
        'pincode': address.pincode,
        'landmark': address.landmark,
      }).then((value) => null);
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }
}
