import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';

class Wishlist {
  Wishlist({required this.context});
  final BuildContext context;
  Future<void> addToWishlist(String productId) async {
    try {
      String uid = FirebaseInstanceModel.uid;
      await FirebaseInstanceModel.wishlist
          .doc(uid)
          .collection('userwishlist')
          .doc(productId)
          .set({'productid': productId}).then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Successfully added')));
      });
      return;
    } on FirebaseException catch (e) {
      alertshower(e.message);
      return;
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    try {
      String uid = FirebaseInstanceModel.uid;
      await FirebaseInstanceModel.wishlist
          .doc(uid)
          .collection('userwishlist')
          .doc(productId)
          .delete()
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Removed from wishlist')));
        return;
      });
    } on FirebaseException catch (e) {
      alertshower(e.message);
      return;
    }
  }

  alertshower(String? e) {
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
