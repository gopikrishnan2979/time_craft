import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/services/firebase/wishlist.dart';

class WishlistController extends ChangeNotifier {
  List<String> wishlist = [];

  getwishlist() async {
    wishlist = await FirebaseInstanceModel.wishlist
        .doc(FirebaseInstanceModel.uid)
        .collection('userwishlist')
        .get()
        .then((value) => value.docs.map((element) => element.id).toList());
  }

  add({required String productId, required BuildContext context}) {
    wishlist.add(productId);
    notifyListeners();
    WishlistService(context: context).addToWishlist(productId);
  }

  remove({required String productId, required BuildContext context}) {
    wishlist.remove(productId);
    notifyListeners();
    WishlistService(context: context).removeFromWishlist(productId);
  }
}
