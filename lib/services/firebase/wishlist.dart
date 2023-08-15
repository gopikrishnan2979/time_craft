import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_craft/model/firebase_instance_model.dart';

class WishlistService {
  Future<String?> addToWishlist(String productId) async {
    try {
      String uid = FirebaseInstances.uid!;
     return await FirebaseInstances.wishlist
          .doc(uid)
          .collection('userwishlist')
          .doc(productId)
          .set({'productid': productId}).then((value) => null);
    } on FirebaseException catch (e) {
      return e.message??'';
    }
  }

  Future<String?> removeFromWishlist(String productId) async {
    try {
      String uid = FirebaseInstances.uid!;
      return await FirebaseInstances.wishlist
          .doc(uid)
          .collection('userwishlist')
          .doc(productId)
          .delete()
          .then((value) => null);
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }
}
