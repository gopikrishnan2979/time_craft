import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/payment_selector/payment_selector.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/widgets/payment_tiles.dart';

class PaymentPart extends StatelessWidget {
  const PaymentPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: khieght * 0.18,
      width: kwidth,
      padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05),
      child: Consumer<PaymentSelector>(
        builder: (context, selector, child) {
          log('message');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your payment method',
                style: inter,
              ),
              sizedboxwithheight(khieght * 0.02),
              InkWell(
                borderRadius: BorderRadius.circular(kwidth * 0.03),
                onTap: () {
                  selector.selectedrazorpay();
                },
                child: PaymentTiles(
                    isactiverazorpay: selector.israzorpay,
                    child: Image.asset(
                      'assets/images/razorpay_img.jpg',
                      width: kwidth * 0.4,
                      alignment: Alignment(0, -khieght * 0.00025),
                      fit: BoxFit.fitWidth,
                    )),
              ),
              sizedboxwithheight(khieght * 0.01),
              InkWell(
                borderRadius: BorderRadius.circular(kwidth * 0.03),
                onTap: () {
                  selector.selectedcod();
                },
                child: PaymentTiles(
                  isactiverazorpay: !selector.israzorpay,
                  child: Text(
                    'CASH ON DELIVERY',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
