import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              imgpath,
              fit: BoxFit.cover,
            )),
        SizedBox(
          width: kwidth * 0.06,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Titan Watch',
              style: GoogleFonts.inter(fontSize: 16),
            ),
            Text(
              '₹799',
              style: inter,
            )
          ],
        ),
        Expanded(
          child: SizedBox(
            width: kwidth * 0.1,
          ),
        ),
        SizedBox(
          width: 80,
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
    );
  }

  Widget incAndDecButton({required IconData icon}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.5),
      child: ColoredBox(
          color: black,
          child: SizedBox(
            width: 25,
            height: 25,
            child: Icon(
              icon,
              color: white,
              size: 20,
            ),
          )),
    );
  }
}
