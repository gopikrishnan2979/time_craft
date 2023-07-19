import 'package:flutter/material.dart';
import 'package:time_craft/model/product_argument.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/checkout.dart';
import 'package:time_craft/view/screens/product/widgets/add_to_cart_alert.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/screens/product/widgets/scrolling_part.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key,required this.data});
  final ProductArgument data;

  static const routename = '/Product';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: const AppbarCom(title: 'Product'),
        body: Column(
          children: [
             ProductScrollingPart(data: data),
            SizedBox(
              height: khieght * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(CheckOutScrn.routename);
                    },
                    style: _buttonstyle(),
                    child: _buttonchild('BUY NOW'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddToCartAlert(),
                      );
                    },
                    style: _buttonstyle(),
                    child: _buttonchild('ADD TO CART'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buttonstyle() {
    return ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(black),
        foregroundColor: const MaterialStatePropertyAll(white),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
  }

  Widget _buttonchild(String text) {
    return SizedBox(
        height: khieght * 0.06,
        width: kwidth * 0.27,
        child: Center(
            child: Text(
          text,
          style: interwhitebold,
        )));
  }
}
