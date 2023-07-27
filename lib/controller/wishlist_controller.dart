import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';

class WishlistController extends ChangeNotifier {
  List<String> wishlist = [];

  getwishlist() async {
    wishlist = await FirebaseInstanceModel.wishlist
        .doc(FirebaseInstanceModel.uid)
        .collection('userwishlist')
        .get()
        .then((value) => value.docs.map((element) => element.id).toList());
  }

  add(String productId) {
    wishlist.add(productId);
    notifyListeners();
  }

  remove(String productId) {
    wishlist.remove(productId);
    notifyListeners();
  }
}
