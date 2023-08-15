import 'package:flutter/material.dart';
import 'package:time_craft/model/cart_model.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/services/firebase/cart.dart';

class CartController extends ChangeNotifier {
  //-------------------Cart list
  List<CartModel> cartList = [];
  int totalCartPrice = 0;

  //--------------------------fetching data from cart databases
  getCartList() async {
    try {
      List data = await FirebaseInstances.cart
          .doc(FirebaseInstances.uid)
          .collection('usercart')
          .get()
          .then((value) => value.docs);
      totalCartPrice = 0;
      cartList.clear();
      for (var element in data) {
        CartModel cartItem = CartModel.fromData(data: element);
        totalCartPrice += (cartItem.price! * cartItem.quantity!);
        cartList.add(cartItem);
      }
      notifyListeners();
    } catch (e) {
      return;
    }
  }

  //------------------------------------cart product quantity increasing
  Future<String?> productQtyInc({required int index}) async {
    CartModel data = cartList[index];
    data.quantity = data.quantity! + 1;
    data.totalprice = data.totalprice! + data.price!;
    totalCartPrice += data.price!;
    notifyListeners();
    return CartService().updateCartItem(
        productId: data.productId!,
        updateQty: data.quantity!,
        varient: data.varient!,
        price: data.price!);
  }

  // ------------------------------------cart product quantity decreasing
  Future<String?> productQtyDec({required int index}) async {
    CartModel data = cartList[index];
    if (data.quantity! > 1) {
      data.quantity = data.quantity! - 1;
      data.totalprice = data.totalprice! - data.price!;
      totalCartPrice -= data.price!;
      notifyListeners();
      return await CartService().updateCartItem(
        productId: data.productId!,
        updateQty: data.quantity!,
        varient: data.varient!,
        price: data.price!,
      );
    }
    return null;
  }

  //--------------------------------------deleting product from cart
  Future<String?> productDelete({required int index}) async {
    CartModel data = cartList[index];
    String? error = await CartService().deleteCartItem(cartProductId: data.cartProductId!);
    totalCartPrice -= cartList[index].totalprice!;
    cartList.removeAt(index);
    notifyListeners();
    return error;
  }
}
