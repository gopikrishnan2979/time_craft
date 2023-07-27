import 'package:flutter/material.dart';
import 'package:time_craft/services/firebase/wishlist.dart';

class WishlistIconController extends ChangeNotifier {
  bool isInWishlist;
  final String productid;
  WishlistIconController({required this.isInWishlist, required this.productid});
  toggle(BuildContext context) {
    isInWishlist = !isInWishlist;
    notifyListeners();
    if (isInWishlist) {
      Wishlist(context: context).addToWishlist(productid);
    } else {
      Wishlist(context: context).removeFromWishlist(productid);
    }
  }
}
