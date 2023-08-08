import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/model/cart_model.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/services/firebase/cart.dart';
import 'package:time_craft/view/core/styles.dart';

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
  productQtyInc({required int index, required BuildContext context}) {
    CartModel data = cartList[index];
    data.quantity = data.quantity! + 1;
    data.totalprice = data.totalprice! + data.price!;
    totalCartPrice += data.price!;
    notifyListeners();
    CartService(context: context).updateCartItem(
        productId: data.productId!,
        updateQty: data.quantity!,
        varient: data.varient!,
        price: data.price!);
  }

  // ------------------------------------cart product quantity decreasing
  productQtyDec({required int index, required BuildContext context}) {
    CartModel data = cartList[index];
    if (data.quantity! > 1) {
      data.quantity = data.quantity! - 1;
      data.totalprice = data.totalprice! - data.price!;
      totalCartPrice -= data.price!;
      notifyListeners();
      CartService(context: context).updateCartItem(
          productId: data.productId!,
          updateQty: data.quantity!,
          varient: data.varient!,
          price: data.price!);
    }
  }

  //--------------------------------------deleting product from cart
  productDelete({required int index, required BuildContext context}) {
    CartModel data = cartList[index];
    CartService(context: context).deleteCartItem(cartProductId: data.cartProductId!);
    totalCartPrice -= cartList[index].totalprice!;
    cartList.removeAt(index);
    notifyListeners();
  }

  //--------------------------------------deletion confirmation popUp
  productDeleteConfirmation({required BuildContext context, required int index}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.red),
            Text(
              'Delete',
              style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: const Text('Are you sure, Delete this item'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel', style: interbold),
          ),
          TextButton(
            onPressed: () {
              productDelete(index: index, context: context);
              Navigator.of(context).pop();
            },
            child: Text(
              'Delete',
              style: GoogleFonts.inter(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
