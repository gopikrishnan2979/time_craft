import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class ProductNameToDiscription extends StatelessWidget {
  const ProductNameToDiscription(
      {super.key,
      required this.discount,
      required this.discription,
      required this.name,
      required this.price,
      required this.smallDiscription});
  final int price;
  final int discount;
  final String name;
  final String smallDiscription;
  final String discription;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        sizedboxwithheight(khieght * 0.015),
        Text(
          smallDiscription,
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        sizedboxwithheight(khieght * 0.015),
        Row(
          children: [
            Text(
              '$discount% OFF',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(
              width: kwidth * 0.08,
            ),
            Text(
              '₹$price',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold),
            )
          ],
        ),
        _titletext('Discription'),
        Text(
          discription,
          style: GoogleFonts.inter(fontSize: 12),
          textAlign: TextAlign.justify,
        ),
        sizedboxwithheight(khieght * 0.01),
      ],
    );
  }

  Widget _titletext(String text) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      sizedboxwithheight(khieght * 0.01),
      Text(
        text,
        style: inter,
      )
    ]);
  }
}
