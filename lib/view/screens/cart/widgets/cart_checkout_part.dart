import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/checkout.dart';

class CartCheckOut extends StatelessWidget {
  const CartCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      width: double.infinity,
      height: khieght * 0.08,
      child: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CheckOutScrn.routename);
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(white),
            shape: MaterialStatePropertyAll(ContinuousRectangleBorder())),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text('CHECKOUT', style: interbold),
        ),
      )),
    );
  }
}
