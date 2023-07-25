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
      required int price}) async {
    try {
      log('$qty');
      FirebaseInstanceModel.cart
          .doc(FirebaseInstanceModel.uid)
          .collection('usercart')
          .doc('$productId$varient')
          .set({'productId': productId, 'varient': varient, 'qty': qty, 'price': price},
              SetOptions(merge: true)).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // margin:
            //     EdgeInsets.only(bottom: khieght * 0.05, left: kwidth * 0.04, right: kwidth * 0.04),
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
            backgroundColor: Color.fromARGB(122, 0, 0, 0)));
      });
      // log(obj.toString());
    } on FirebaseException catch (e) {
      log(e.message ?? '');
    }
  }
}
