import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/services/firebase/wishlist.dart';

//wishlist screen controller for controlling the wishlist
class WishlistController extends ChangeNotifier {

  List<String> wishlist = [];

//-----get the wishlist data from the database as the user enters
  getwishlist() async {
    try {
      wishlist = await FirebaseInstances.wishlist
          .doc(FirebaseInstances.uid)
          .collection('userwishlist')
          .get()
          .then((value) => value.docs.map((element) => element.id).toList());
    } on FirebaseException catch (_) {
      return;
    }
  }

//-----add the item to the wishlist
  Future<String?>add({required String productId}) async {
    wishlist.add(productId);
    notifyListeners();
    return await WishlistService().addToWishlist(productId);
  }

//-----remove the item from the wishlist
 Future<String?> remove({required String productId}) async{
    wishlist.remove(productId);
    notifyListeners();
    return await WishlistService().removeFromWishlist(productId);
  }
}
