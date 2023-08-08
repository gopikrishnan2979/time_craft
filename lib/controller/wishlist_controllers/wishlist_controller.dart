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
    } catch (e) {
      return;
    }
  }

//-----add the item to the wishlist
  add({required String productId, required BuildContext context}) {
    wishlist.add(productId);
    notifyListeners();
    WishlistService(context: context).addToWishlist(productId);
  }
//-----remove the item from the wishlist
  remove({required String productId, required BuildContext context}) {
    wishlist.remove(productId);
    notifyListeners();
    WishlistService(context: context).removeFromWishlist(productId);
  }
}
