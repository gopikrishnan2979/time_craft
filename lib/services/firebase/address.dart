import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/core/styles.dart';

class AddressService {
  BuildContext context;
  AddressService({required this.context});
  addAddress({required AddressModel address}) async {
    try {
      await FirebaseInstanceModel.address.add({
        'localAddress': address.localAddress,
        'city': address.city,
        'district': address.district,
        'state': address.state,
        'pincode': address.pincode,
        'landmark': address.landmark,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(_addedSuccess());
      });
    } on FirebaseException catch (e) {
      _alertshower(e.message);
    }
  }

  SnackBar _addedSuccess() {
    return SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 800),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        elevation: 15,
        content: Center(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Text('Address added successfully',
                  style: GoogleFonts.ptSerif(color: white, fontSize: 16))),
        ),
        backgroundColor: const Color.fromARGB(122, 0, 0, 0));
  }

  _alertshower(String? e) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: Text(e ?? ''),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
