import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class CartAddmore extends StatelessWidget {
  const CartAddmore({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.07,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Free delivery in 5 days', style: GoogleFonts.inter(fontSize: 12)),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(ContinuousRectangleBorder()),
                  backgroundColor: MaterialStatePropertyAll(black)),
              child: Row(
                children: [
                  const Icon(Icons.add_shopping_cart, color: white, size: 18),
                  const SizedBox(width: 8),
                  Text('Add more', style: GoogleFonts.inter(color: Colors.white, fontSize: 14)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
