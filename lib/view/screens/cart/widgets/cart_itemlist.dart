import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/cart/widgets/cart_tile.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //first widget

          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const CartTile(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedboxwithheight(khieght * 0.2),
                Text(
                  'PRICE DETAILS',
                  style: inter,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: inter,
                        ),
                        Text('DELIVERY FEE', style: inter)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('₹1598', style: inter),
                        Text('₹0.00', style: inter)
                      ],
                    )
                  ],
                ),
                sizedboxwithheight(20),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05),
                    child: Container(
                      height: 50,
                      color: black,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kwidth * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: interwhitebold,
                            ),
                            Text('₹1598', style: interwhitebold)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                sizedboxwithheight(30)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
