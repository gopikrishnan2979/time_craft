import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

class PaymentTiles extends StatelessWidget {
  const PaymentTiles(
      {super.key, required this.child, required this.isactiverazorpay});
  final Widget child;
  final bool isactiverazorpay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(kwidth * 0.04),
      ),
      padding: const EdgeInsets.only(left: 20),
      height: 45,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kwidth * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Center(child: child)),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(), shape: BoxShape.circle),
              width: kwidth * 0.08,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isactiverazorpay ? Colors.black : Colors.transparent),
                  width: kwidth * 0.05,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
