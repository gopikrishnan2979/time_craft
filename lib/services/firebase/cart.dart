import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/core/styles.dart';

class CartService {
  BuildContext context;
  CartService({required this.context});
  addToCart(
      {required String productId,
      required String varient,
      required int qty,
      required int price,required String name, required String imageLink}) async {
    try {
      FirebaseInstanceModel.cart
          .doc(FirebaseInstanceModel.uid)
          .collection('usercart')
          .doc('$productId$varient')
          .set({'name':name,'productId': productId, 'varient': varient, 'qty': qty, 'price': price,'imageLink':imageLink},
              SetOptions(merge: true)).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(milliseconds: 800),
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            elevation: 15,
            content: Center(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Text(
                    'Item Added To Cart',
                    style: GoogleFonts.ptSerif(color: white, fontSize: 16),
                  )),
            ),
            backgroundColor: const Color.fromARGB(122, 0, 0, 0)));
      });
      // log(obj.toString());
    } on FirebaseException catch (e) {
      log(e.message ?? '');
    }
  }

  updateCartItem(
      {required String productId,
      required int updateQty,
      required String varient,
      required int price}) {
    try {
      FirebaseInstanceModel.cart
          .doc(FirebaseInstanceModel.uid)
          .collection('usercart')
          .doc(productId + varient)
          .set({
        'qty': updateQty,
      }, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }

  deleteCartItem({required String cartProductId}) async {
    await FirebaseInstanceModel.cart
        .doc(FirebaseInstanceModel.uid)
        .collection('usercart')
        .doc(cartProductId)
        .delete();
  }
}
