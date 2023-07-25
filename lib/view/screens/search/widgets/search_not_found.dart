import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Search for awesome products',
            style: GoogleFonts.inter(color: black, fontSize: 17),
          ),
          SizedBox(
              height: khieght * 0.3,
              width: double.infinity,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitWidth,
              )),
        ],
      ),
    );
  }
}
