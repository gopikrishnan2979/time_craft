import 'package:time_craft/model/cart_model.dart';

class CheckoutModel {
  final List<CartModel> itemlist;
  final int totalPrice;
  CheckoutModel({required this.itemlist,required this.totalPrice});
}
