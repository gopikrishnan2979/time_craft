import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_craft/model/firebase_instance_model.dart';

class CartService {
  Future<String?> addToCart({
    required String productId,
    required String varient,
    required int qty,
    required int price,
    required String name,
    required String imageLink,
  }) async {
    try {
      return await FirebaseInstances.cart
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
      }, SetOptions(merge: true)).then((value) => null);
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }

  Future<String?> updateCartItem({
    required String productId,
    required int updateQty,
    required String varient,
    required int price,
  }) async {
    try {
      return await FirebaseInstances.cart
          .doc(FirebaseInstances.uid)
          .collection('usercart')
          .doc(productId + varient)
          .set({
        'qty': updateQty,
      }, SetOptions(merge: true)).then((value) => null);
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }

  Future<String?> deleteCartItem({required String cartProductId}) async {
    try {
      return await FirebaseInstances.cart
          .doc(FirebaseInstances.uid)
          .collection('usercart')
          .doc(cartProductId)
          .delete()
          .then((value) => null);
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }
}
