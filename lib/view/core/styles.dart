import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color white = Colors.white;
const Color black = Colors.black;
late double khieght;
late double kwidth;
final TextStyle interbold = GoogleFonts.inter(fontWeight: FontWeight.bold, color: black);
final TextStyle inter = GoogleFonts.inter(color: black);
final TextStyle interwhite = GoogleFonts.inter(color: white);
final TextStyle interwhitebold = GoogleFonts.inter(color: white, fontWeight: FontWeight.bold);
final TextStyle interbluebold =
    GoogleFonts.inter(color: const Color(0xFF3964FC), fontWeight: FontWeight.bold);
final TextStyle orderText = GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold);
String imgpath =
    'https://img.tatacliq.com/images/i11/437Wx649H/MP000000017555695_437Wx649H_202305151743161.jpeg';
sizedboxwithheight(double? height) {
  return SizedBox(
    height: height,
  );
}

// List<String> varients = ['Red', 'Brown', 'Silver', 'Gold', 'Black', 'White'];
