import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/cart_controller.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/cart/widgets/cart_tile.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        return cartController.cartList.isEmpty
            ? cartIsEmpty()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedboxwithheight(20),
                  Expanded(
                    // height: khieght * 0.48,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartTile(index: index);
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: cartController.cartList.length),
                  ),
                  cartPricing(totalPrice: cartController.totalCartPrice)
                ],
              );
      },
    );
  }

  Widget cartIsEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/lotties/CartEmpty.json'),
          const Text('Cart Is Empty'),
        ],
      ),
    );
  }

  Widget cartPricing({required int totalPrice}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08, vertical: khieght * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PRICE DETAILS', style: interbold),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('SUBTOTAL', style: inter),
                Text('DELIVERY FEE', style: inter),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('₹$totalPrice', style: inter),
                Text('₹0.00', style: inter),
              ])
            ],
          ),
          sizedboxwithheight(20),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05),
              child: Container(
                height: khieght * 0.065,
                color: black,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: interwhitebold),
                      Text('₹$totalPrice', style: interwhitebold)
                    ],
                  ),
                ),
              ),
            ),
          ),
          // sizedboxwithheight(khieght * 0.01)
        ],
      ),
    );
  }
}
