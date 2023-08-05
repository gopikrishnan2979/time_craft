import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';

class CartService {
  BuildContext context;
  CartService({required this.context});
  addToCart(
      {required String productId,
      required String varient,
      required int qty,
      required int price,
      required String name,
      required String imageLink}) async {
    try {
      FirebaseInstances.cart
          .doc(FirebaseInstances.uid)
          .collection('usercart')
          .doc('$productId$varient')
          .set({
        'name': name,
        'productId': productId,
        'varient': varient,
        'qty': qty,
        'price': price,
        'imageLink': imageLink
      }, SetOptions(merge: true)).then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBarDesign(text: 'Item Added To Cart', color: addingColor));
      });
    } on FirebaseException catch (e) {
      alertshower(text: e.message ?? '', context: context);
    }
  }

  updateCartItem(
      {required String productId,
      required int updateQty,
      required String varient,
      required int price}) {
    try {
      FirebaseInstances.cart
          .doc(FirebaseInstances.uid)
          .collection('usercart')
          .doc(productId + varient)
          .set({
        'qty': updateQty,
      }, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      alertshower(context: context, text: e.message.toString());
    }
  }

  deleteCartItem({required String cartProductId}) async {
    try {
      await FirebaseInstances.cart
          .doc(FirebaseInstances.uid)
          .collection('usercart')
          .doc(cartProductId)
          .delete()
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBarDesign(text: 'Item removed from Cart', color: removingColor));
      });
    } on FirebaseException catch (e) {
      alertshower(text: e.message, context: context);
    }
  }
}
