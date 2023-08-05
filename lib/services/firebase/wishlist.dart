import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';

class WishlistService {
  WishlistService({required this.context});
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
            .showSnackBar(snackBarDesign(text: 'Added to wishlist', color: addingColor));
      });
      return;
    } on FirebaseException catch (e) {
      alertshower(context: context, text: e.message);
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
            .showSnackBar(snackBarDesign(text: 'Removed from wishlist', color: removingColor));
        return;
      });
    } on FirebaseException catch (e) {
      alertshower(context: context, text: e.message);
      return;
    }
  }
}
