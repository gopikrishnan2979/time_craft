import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class AddToCartAlert extends StatelessWidget {
  const AddToCartAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'ADD TO CART',
        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: kwidth * 0.1, vertical: khieght * 0.01),
      content: SizedBox(
        height: khieght * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Titan watch',
              style: interbold,
            ),
            Row(
              children: [
                Text(
                  'QTY  :',
                  style: inter,
                ),
                SizedBox(
                  width: kwidth * 0.05,
                ),
                SizedBox(
                  width: kwidth * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      incAndDecButton(icon: Icons.add),
                      Text(
                        '1',
                        style: GoogleFonts.inter(fontSize: 20),
                      ),
                      incAndDecButton(icon: Icons.remove)
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Cost :',
                  style: inter,
                ),
                Text(
                  ' ₹799',
                  style: inter,
                )
              ],
            ),
            addtocartbutton(context),
          ],
        ),
      ),
    );
  }

  Widget incAndDecButton({required IconData icon}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(khieght * 0.0125),
      child: ColoredBox(
          color: black,
          child: SizedBox(
            width: khieght * 0.025,
            height: khieght * 0.025,
            child: Icon(
              icon,
              color: white,
              size: khieght * 0.02,
            ),
          )),
    );
  }

  Widget addtocartbutton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ButtonStyle(
            fixedSize:
                MaterialStatePropertyAll(Size(kwidth * 0.5, khieght * 0.02)),
            backgroundColor: const MaterialStatePropertyAll(black),
            shape: const MaterialStatePropertyAll(
              ContinuousRectangleBorder(),
            )),
        child: Text(
          'Add to cart',
          style: interwhitebold,
        ));
  }
}
