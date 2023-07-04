import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class ProductNameToDiscription extends StatelessWidget {
  const ProductNameToDiscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product name',
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        sizedboxwithheight(khieght * 0.015),
        Text(
          'Minimalist watch for men',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        sizedboxwithheight(khieght * 0.015),
        Row(
          children: [
            Text(
              '70% OFF',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(
              width: kwidth * 0.08,
            ),
            Text(
              '₹799',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold),
            )
          ],
        ),
        _titletext('Discription'),
        Text(
          'Introducing our sleek and stylish watch, the perfect accessory to complement any outfit. With its elegant design and superior craftsmanship, this timepiece will make a statement wherever you go.',
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
