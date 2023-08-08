import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/cart_controllers/cart_controller.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/cart/widgets/cart_addmore_part.dart';
import 'package:time_craft/view/screens/cart/widgets/cart_checkout_part.dart';
import 'package:time_craft/view/screens/cart/widgets/cart_itemlist.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  static const String routename = '/Cart';
  @override
  Widget build(BuildContext context) {
    Provider.of<CartController>(context, listen: false).getCartList();
    return const SafeArea(
        child: Scaffold(
      backgroundColor: white,
      appBar: AppbarCom(title: 'Cart'),
      body: Column(
        children: [
          CartAddmore(),
          Expanded(child: CartItems()),
          CartCheckOut(),
        ],
      ),
    ));
  }
}
