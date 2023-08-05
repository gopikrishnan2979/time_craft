import 'package:flutter/material.dart';
import 'package:time_craft/model/cart_model.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/widgets/checkout_item_tile.dart';

class ScrollingPart extends StatelessWidget {
  const ScrollingPart({super.key, required this.datalist});
  final List<CartModel> datalist;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order list', style: interbold),
          sizedboxwithheight(khieght * 0.01),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) => CheckoutItemTile(data: datalist[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: datalist.length,
          )),
        ],
      ),
    ));
  }
}
