import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/order_placed.dart';
import 'package:time_craft/view/screens/checkout/widgets/payment_part.dart';
import 'package:time_craft/view/screens/checkout/widgets/scrolling_part.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';

class CheckOutScrn extends StatelessWidget {
  const CheckOutScrn({super.key});
  static const String routename = '/Checkout';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Checkout'),
        body: Column(
          children: [
            const ScrollingPart(),
            const PaymentPart(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'TOTAL',
                  style: interbold,
                ),
                Text(
                  '₹1500',
                  style: interbold,
                )
              ],
            ),
            sizedboxwithheight(khieght * 0.01),
            placeOrderButton(context),
            sizedboxwithheight(khieght * 0.01),
          ],
        ),
      ),
    );
  }

  Widget placeOrderButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(OrderPlaced.routename);
        },
        style: ButtonStyle(
            fixedSize:
                MaterialStatePropertyAll(Size(kwidth * 0.6, khieght * 0.01)),
            backgroundColor: const MaterialStatePropertyAll(black),
            foregroundColor: const MaterialStatePropertyAll(white),
            shape: const MaterialStatePropertyAll(ContinuousRectangleBorder())),
        child: const Text(
          'PLACE ORDER',
        ));
  }
}
