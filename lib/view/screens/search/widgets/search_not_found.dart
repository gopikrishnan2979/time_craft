import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Search for awesome products',
          style: GoogleFonts.inter(color: black, fontSize: 17),
        ),
        Container(
            height: khieght * 0.3,
            width: double.infinity,
            color: Colors.amber,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitWidth,
            )),
      ],
    );
  }
}
