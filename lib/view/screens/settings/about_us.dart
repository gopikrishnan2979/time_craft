import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      surfaceTintColor: white,
      content: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image.asset('assets/images/logo.png', fit: BoxFit.cover)),
            const Text(
              'Time Craft is a watch ecommerce that specializes in unique and handcrafted watches. We believe that every watch should be a work of art, and we strive to offer our customers a wide variety of watches that are both stylish and functional. The products displayed are made from high-quality materials and are built to last. You can get a watch that is truly unique to you.',
              style: TextStyle(fontFamily: 'Peddana', fontSize: 14),
            ),
          ],
        ),
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Created by :- Gopikrishnan Nair S',
              style: TextStyle(fontFamily: 'Peddana', fontSize: 13),
            ),
          ],
        )
      ],
    );
  }
}
